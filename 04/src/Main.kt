import java.io.File
import java.io.InputStream

fun main(args: Array<String>) {
    val inputStream: InputStream = File("input.txt").inputStream()
    val lineList = mutableListOf<String>()
    inputStream.bufferedReader().useLines { lines -> lines.forEach {
        lineList.add(it)
    } }
    val numOfLines = lineList.filter{
        var list = it.split(" ")
        list = list.map{
            var charArray = it.toCharArray()
            charArray.sort()
            charArray.joinToString("")
        }
        println(list.joinToString(" "))
        list.distinct().size == list.size
    }.size

    println(numOfLines)
}
