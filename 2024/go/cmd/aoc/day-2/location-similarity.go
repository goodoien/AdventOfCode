package day2

import (
	day1 "aoc/2024/cmd/aoc/day-1"
	"fmt"
)

func LocationSimilarity() {
	fmt.Println("Day 2 - Location Similarity")

	leftgroup, rightgroup := day1.Leftgroup, day1.Rightgroup

	scoreArray := make([]int, len(leftgroup))
	finalScore := 0

	for i := range leftgroup {
		multiplyer := 0
		primeNumber := leftgroup[i]
		for j := range rightgroup {
			if primeNumber == rightgroup[j] {
				multiplyer += 1
			}
		}
		scoreArray[i] = primeNumber * multiplyer
	}

	for i := range scoreArray {
		finalScore += scoreArray[i]
	}

	fmt.Println(finalScore)
}
