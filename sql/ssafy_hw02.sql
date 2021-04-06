use scott;

-- 1번 부서위치가 CHICAGO인 모든 사원에 대해 이름,업무,급여 출력하는 SQL을 작성하세요.
select ename '이름', job '업무', sal '급여'
from emp e join dept d 
on e.deptno = d.deptno
and d.loc = 'CHICAGO';

-- 2번 부하직원이 없는 사원의 사원번호,이름,업무,부서번호 출력하는 SQL을 작성하세요.
select empno '사원번호', ENAME '이름', job '업무', deptno '부서번호'
from emp
where empno not in (
					select distinct mgr
                    from emp
                    where mgr is not null
                    )
order by empno;

-- 3번 BLAKE와 같은 상사를 가진 사원의 이름,업무,상사번호 출력하는 SQL을 작성하세요.
select ename '이름', job '업무', mgr '상사번호'
from emp
where ename <> 'BLAKE' 
and
mgr = (
	select mgr
	from emp
	where ename = 'BLAKE'
);

-- 4번 입사일이 가장 오래된 사람 5명을 검색하세요.
select ename '이름', job '업무', mgr '상사번호'
from emp
order by hiredate
limit 5;

-- 5번 JONES 의 부하 직원의 이름, 업무, 부서명을 검색하세요.
select ename '이름', job '업무', dname '부서명'
from (
	select deptno, ename, job
	from emp
	where mgr in (				-- 'in' 사용: 'JONES' 이름을 가진 동명이인이 있을 수 있기 떄문에
		select empno
		from emp 
		where ename = 'JONES'
        )
) as t							-- 'JONES' 부하 관련 inline view 
join dept as d
on t.deptno = d.deptno;


