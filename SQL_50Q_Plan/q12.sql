select
    st.student_id
  , st.student_name
  , su.subject_name
  , count(ex.subject_name) as attended_exams
from
  students as st
cross join
  subjects as su
left join
  examinations as ex
    on
      st.student_id = ex.student_id
      and su.subject_name = ex.subject_name
group by
    st.student_id
  , st.student_name
  , su.subject_name
order by
    st.student_id asc
  , su.subject_name asc;