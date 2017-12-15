package main

import "io/ioutil"
import "fmt"

func main() {
	buf, err := ioutil.ReadFile("input.txt")
	if (err != nil) {
		fmt.Println("Error reading file")
	}
		file := string(buf)
	total := 0
	isIgnored := false
	garbageCount := 0
	isGarbage := false
	level := 0
	for _, element := range file {
		if isGarbage {
			if isIgnored {
				isIgnored = false
				continue
			}
			if element == '>' {
				isGarbage = false
				continue
			}
			if element == '!' {
				isIgnored = true
				continue
			}
			garbageCount++
			continue
		}
		if element == '<' {
			isGarbage = true
		}
		if element == '{' {
			level++
		}
		if element == '}' {
			total = total + level
			if (level > 0) {
				level = level - 1
			}
		}
		fmt.Printf("%c", element)
	}
	fmt.Println(garbageCount)
}
