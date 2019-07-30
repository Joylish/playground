fun main() {
    val playerName = "에스트라곤"
    val barName = "Unicorn's Horn"
    val barOwnerName = "디오니소스"
    var hasSteed = "false"
    var experiencePoints = 5
    val alcoholList = listOf("honey beer", "wine", "Lacroix")
    var goldfinich = 0
    experiencePoints += 5
    goldfinich += 50
    println(playerName + "의 점수는 " + experiencePoints)
    println("현재 말을 소유하고 있는지 여부: " + hasSteed)
    println(barName + "에 도착했다.")
    println(playerName + "은 이렇게 말했다")
    println("나는 금화 "+ goldfinich+ "개가 있으니 술을 먹겠다.")
    println("술집주인 " + barOwnerName + "는 말한다")
    println("현재 " + alcoholList +"가 있습니다. 무엇을 드릴까요?")
}