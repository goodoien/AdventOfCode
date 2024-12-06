package day1

import (
	"bufio"
	"fmt"
	"log"
	"math"
	"os"
	"sort"
	"strconv"
	"strings"
)

var Leftgroup, Rightgroup []int

func LocationDistance() {
	fmt.Println("Day 1 - LocationDistance")

	Leftgroup, Rightgroup = ParseFile("location-ids.txt")

	sort.Ints(Leftgroup)
	sort.Ints(Rightgroup)

	differenceArray := make([]float64, len(Leftgroup))
	for i := range Leftgroup {
		difference := Leftgroup[i] - Rightgroup[i]
		differenceArray[i] = math.Abs(float64(difference))
	}

	total := 0

	for i := range differenceArray {
		total += int(differenceArray[i])
	}

	fmt.Println(total)

}

func ParseFile(filepath string) ([]int, []int) {
	leftgroup := []int{}
	rightgroup := []int{}
	file, err := os.Open(filepath)

	if err != nil {
		panic(err)
	}

	defer file.Close()

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		line := scanner.Text()
		split := strings.Split(line, "  ")
		leftInt, err1 := strconv.Atoi(strings.TrimSpace(split[0]))
		if err1 != nil {
			panic(err1)
		}
		rightInt, err2 := strconv.Atoi(strings.TrimSpace(split[1]))
		if err2 != nil {
			panic(err2)
		}
		leftgroup = append(leftgroup, leftInt)
		rightgroup = append(rightgroup, rightInt)
	}
	if err := scanner.Err(); err != nil {
		log.Fatal(err)
	}
	return leftgroup, rightgroup
}
