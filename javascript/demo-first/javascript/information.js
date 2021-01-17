let data = [
    {
        "pno":"p001",
        "pname":"전자인사관리시스템",
        "pmgr":"홍길동",
        "pdescription":"기업내 인사정보를 관리하는 시스템"
    },
    {
        "pno":"p002",
        "pname":"도서관리시스템",
        "pmgr":"고길동",
        "pdescription":"도서정보를 관리하는 시스템"
    },
    {
        "pno":"p003",
        "pname":"사이버서비스시스템",
        "pmgr":"김길동",
        "pdescription":"사이버서비스정보를 관리하는 시스템"
    },
    {
        "pno":"p004",
        "pname":"스마트카드모바일서비스티머니앱",
        "pmgr":"빅길동",
        "pdescription":"스마트카드정보를 관리하는 시스템"
    },
    {
        "pno":"p005",
        "pname":"모바일소셜네트워크서비스앱",
        "pmgr":"이길동",
        "pdescription":"모바일로 소셜네트워크서비스정보를 보는 시스템"
    },
    {
        "pno":"p006",
        "pname":"안드로이드게임앱",
        "pmgr":"이길동",
        "pdescription":"안드로이드게임정보를 관리하는 시스템"
    }
]
const changeInfo= (pno) => {
    let target= data[parseInt(pno.substring(1))-1];
    console.log(target)
    document.getElementById("pno").innerText = target.pno;
    document.getElementById("pmgr").innerText = target.pmgr;
    document.getElementById("pdescription").innerText = target.pdescription;
}