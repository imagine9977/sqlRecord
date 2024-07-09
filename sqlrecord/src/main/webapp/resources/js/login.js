
        
        // 로그인 , 가입 클릭시 
        document.querySelector('.img__btn').addEventListener('click', function() {
            document.querySelector('.cont').classList.toggle('s--signup');
        });


        //팝업창
        $(document).ready(function(){
            $(".infopop").click(function(event){
                event.preventDefault();
                $(".tab_content").addClass("active");
            });
            
            $(".pop_clo").click(function(event){
                event.preventDefault();
                $(".tab_content").removeClass("active");
            });

        });

        //회원가입
        
        function joinCheck(f){
            if(f.memberPw.value!=f.memberPw2.value){
                alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
                f.memberPw.focus();
                return false;
            }
            if(f.idck.value!="yes"){
                alert("아이디 중복 체크를 하지 않으셨습니다.");
                return false;
            }
        }
        
        
        //우편번호 검색
        function searchpostcode() {
        	new daum.Postcode({
                oncomplete: function(data) {
                    console.log(data);
                    var roadAddr = data.roadAddress;
                    var jibunAddr = data.jibunAddress;
                    document.getElementById("postNum").value = data.zonecode;
                    if(roadAddr !== '') {
                        document.getElementById("addr1").value = roadAddr;
                    } else if(jibunAddr !== ''){
                        document.getElementById("addr1").value = jibunAddr;
                    }
                    document.getElementById("addr2").focus();
                }
            }).open();
        }
    
        
        //가입시 태그 선택 DB에 저장
        function getSelectTgas() {
            var selectTgas = [];
            var checkboxes = document.querySelectorAll('input[name="genre"]:checked');
            checkboxes.forEach(function(checkbox) {
            	selectTgas.push(checkbox.value);
            });
            return selectTgas;
        }
        
        function setGenreTags() {
            var selectTgas = getSelectTgas();
            document.getElementById('tag1').value = selectTgas[0] || ''; // 첫 번째 장르를 설정
            document.getElementById('tag2').value = selectTgas[1] || ''; // 두 번째 장르를 설정
            document.getElementById('tag3').value = selectTgas[2] || ''; // 세 번째 장르를 설정
        	return true;
        }