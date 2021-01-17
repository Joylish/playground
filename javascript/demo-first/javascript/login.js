let data = [
    {
        "userId":"react",
        "password":"react",
    },
]
const check = () => {
    let userId = document.getElementById("userId").value;
    let password = document.getElementById("password").value;
    if (userId === ""){
        alert("아이디를 입력해주세요");          
        return false
    }
    if (password === ""){
        alert("비밀번호를 입력해주세요");          
        return false
    }
    if (data.findIndex(x=> x.userId === userId)){
        alert(`${userId}님 로그인에 실패하였습니다. 아이디와 비밀번호를 확인해주세요`);          
        return false
    }
    location.href = "./Information.html";
}
