# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


videos_login = [
  # http://en.savefrom.net/
  # All_About_The_Woman_Agent_Provocateur_AW15_Lookbook_hd720.mp4 - https://www.youtube.com/watch?v=fv8JEcQa_To
  sexy = Video.create(md5: '6d041328aca5f70e02b6dd0bfc71a837', duration: 41.261666, videotype: 'sexy', videosrc: 'http://r6---sn-q4f7sn7s.googlevideo.com/videoplayback?fexp=9407610%2C9416126%2C9419451%2C9420452%2C9420716%2C9421932%2C9422428%2C9422596%2C9422918%2C9423639%2C9423662%2C9423714%2C9424372%2C9424630%2C9424753&itag=22&ipbits=0&ratebypass=yes&key=yt6&upn=LCnFhk5Lzuo&expire=1450456798&mv=m&mt=1450435060&ms=au&id=o-AIFDU9Nqc66b9p5TamDnSMhaoXqsZiP0L-hr4wtIByUv&mn=sn-q4f7sn7s&pl=40&source=youtube&mm=31&ip=2a03%3A8180%3A1001%3A16a%3A%3A8ee1&mime=video%2Fmp4&lmt=1444192495176504&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Csource%2Cupn%2Cexpire&sver=3&nh=IgpwcjA1LmRmdzA2KgkxMjcuMC4wLjE&signature=506814D5108E3F43E57AAF030EC6FB935FDA91A1.1C30A338CB335C23270D75EC1DA7E7C7D03EF81D&dur=41.308&initcwndbps=8403750&title=All+About+The+Woman%3A+Agent+Provocateur+AW15+Lookbook', audiosrc: nil),
  # 'knew' abstract portrait painting.mp4 - https://www.youtube.com/watch?v=0CaKtbL-NfM
  videoart = Video.create(md5: 'fbde5c6b6c2f8e79f2d84b411941c402', duration: 208.258, videotype: 'videoart', videosrc: 'http://r3---sn-q4f7sn7s.googlevideo.com/videoplayback?expire=1450456747&ms=au&id=o-AOQ0kByxi6EuqmiHVZ9snClFeYc-E_8XnHCSu4QNUW_r&mv=m&mt=1450435060&mn=sn-q4f7sn7s&pl=40&source=youtube&mm=31&ip=2a03%3A8180%3A1001%3A16a%3A%3A8ee1&mime=video%2Fmp4&fexp=9407610%2C9416126%2C9419451%2C9420452%2C9420716%2C9421932%2C9422428%2C9422596%2C9422918%2C9423639%2C9423662%2C9423714%2C9424372%2C9424630%2C9424753&itag=22&ipbits=0&ratebypass=yes&upn=j0-8v2vGnVU&key=yt6&sver=3&nh=IgpwcjA1LmRmdzA2KgkxMjcuMC4wLjE&dur=208.306&signature=B44CFA698CFC4376A3AD3D7B7978988AD2945927.2C95B4F5110BEF99DCAB7955773B085580ADEEA6&initcwndbps=8403750&lmt=1429508352915324&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Csource%2Cupn%2Cexpire&title=%27knew%27+abstract+portrait+painting', audiosrc: nil),
  # El_vuelo_de_TransAsia_235_hd720.mp4 - https://www.youtube.com/watch?v=J0QoWR-3Tm4
  news = Video.create(md5: 'be1c00b6efef2ab3a4ded6b772d1d7d3', duration: 51.64, videotype: 'news', videosrc: 'http://r1---sn-q4f7sn76.googlevideo.com/videoplayback?mt=1450435060&mv=m&signature=0A094EB3953EC5CB64CA1F899C4F111314894C63.3B69C1C89B9E0FEF3BD7F7C948CCA91C94F98378&ms=au&upn=w2RtSygl3aI&mm=31&mn=sn-q4f7sn76&expire=1450456700&mime=video%2Fmp4&key=yt6&itag=22&ipbits=0&lmt=1423065351095655&sver=3&source=youtube&ratebypass=yes&dur=51.687&initcwndbps=8403750&pl=40&nh=IgpwcjA1LmRmdzA2KgkxMjcuMC4wLjE&id=o-AMpYj-Sc9sjoqhhaYekebcQXKF50oLp_hsUsHYfkeLzN&fexp=9407610%2C9416126%2C9419451%2C9420452%2C9420716%2C9421932%2C9422428%2C9422596%2C9422918%2C9423639%2C9423662%2C9423714%2C9424372%2C9424630%2C9424753&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Csource%2Cupn%2Cexpire&ip=2a03%3A8180%3A1001%3A16a%3A%3A8ee1&title=El+vuelo+de+TransAsia+235', audiosrc: nil),
  # NOWNESS_hd720.mp4 - https://www.youtube.com/watch?v=Pt0AvOLLXRc
  comercial1 = Video.create(md5: 'a46d4d8d4861e5f76ce6913e55c43b44', duration: 35.896666, videotype: 'comercial', videosrc: 'http://r6---sn-q4f7sn76.googlevideo.com/videoplayback?initcwndbps=9311250&ipbits=0&lmt=1412222712913762&key=yt6&expire=1450456658&dur=35.967&fexp=9407610%2C9416126%2C9419451%2C9420452%2C9420716%2C9421932%2C9422428%2C9422596%2C9422918%2C9423639%2C9423662%2C9423714%2C9424372%2C9424630%2C9424753&ip=2a03%3A8180%3A1001%3A16a%3A%3A8ee1&mv=m&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Csource%2Cupn%2Cexpire&id=o-AH1CYjH8KAw8oQJs7PhCQp0ChH6hNbAq6nP-EUN-T7Kr&ratebypass=yes&sver=3&mm=31&mn=sn-q4f7sn76&upn=w_djRjiFZUw&mt=1450434900&pl=40&itag=22&ms=au&source=youtube&signature=0192F04C2B22F3DF40EB94EE5400AAF2BC5F5CF5.08E6482C7F9608BE5DDB255CA77F996E2842EFCF&mime=video%2Fmp4&nh=IgpwcjA1LmRmdzA2KgkxMjcuMC4wLjE&title=NOWNESS', audiosrc: nil),
  # Director_s_Cuts_Cara_Delevingne_in_Cara_by_Matthew_Donaldson_hd720.mp4 - https://www.youtube.com/watch?v=qySnMR8W2gE
  comercial2 = Video.create(md5: '541115815455bcab45097a16f5421f54', duration: 109.968, videotype: 'comercial', videosrc: 'http://r3---sn-q4fl6n7y.googlevideo.com/videoplayback?ms=au&mv=m&mt=1450434900&id=o-AMm-jeRqwn5OLJnN3rDb2Y61zKS_YWOjGVz1yvtmN0T0&pl=40&ipbits=0&mn=sn-q4fl6n7y&ip=2a03%3A8180%3A1001%3A16a%3A%3A8ee1&mm=31&initcwndbps=9311250&itag=22&signature=83ABA573AD8E04CDFFDDB8E38176CFB25D59817E.BF7A875317364E10B5DE87E3CCA2D25EFE1466A7&expire=1450456621&upn=F02AIiRbod8&key=yt6&mime=video%2Fmp4&dur=110.016&lmt=1431900090011598&nh=IgpwcjA1LmRmdzA2KgkxMjcuMC4wLjE&ratebypass=yes&sver=3&fexp=9407610%2C9416126%2C9419451%2C9420452%2C9420716%2C9421932%2C9422428%2C9422596%2C9422918%2C9423639%2C9423662%2C9423714%2C9424372%2C9424630%2C9424753&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Csource%2Cupn%2Cexpire&source=youtube&title=Director%E2%80%99s+Cuts%3A+Cara+Delevingne+in+%E2%80%9CCara%E2%80%9D+by+Matthew+Donaldson', audiosrc: nil),
  # Florence_The_Machine_Shake_It_Out_hd720.mp4 - https://www.youtube.com/watch?v=WbN0nX61rIs
  videoclip = Video.create(md5: 'f8e4ea8587f18f1f1566930220ff030b', duration: 281.89, videotype: 'videoclip', videosrc: 'http://r1---sn-q4fl6n7e.googlevideo.com/videoplayback?ms=au&id=o-ADQCj6luhiom2rPNeaXuvxHgV2Z-GIljGqnR3QZrQ9JQ&pl=40&mv=m&mt=1450434900&ipbits=0&key=yt6&ip=2a03%3A8180%3A1001%3A16a%3A%3A8ee1&initcwndbps=9311250&mn=sn-q4fl6n7e&mm=31&fexp=9407610%2C9416126%2C9419451%2C9420452%2C9420716%2C9421932%2C9422428%2C9422596%2C9422918%2C9423639%2C9423662%2C9423714%2C9424372%2C9424630%2C9424753&dur=281.936&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Csource%2Cupn%2Cexpire&expire=1450456576&mime=video%2Fmp4&itag=22&nh=IgpwcjA1LmRmdzA2KgkxMjcuMC4wLjE&ratebypass=yes&sver=3&source=youtube&upn=ol5UruWyzJY&lmt=1428054232265607&signature=B0258894DE62E928045A0EB21925735653EA4D4E.52CF4E6CA539F33D77086A3464F44EB190B1B851&title=Florence+++The+Machine+-+Shake+It+Out', audiosrc: nil),
  # Star_Wars_El_Despertar_de_la_Fuerza_Tráiler_España_Oficial_HD_hd720.mp4 - https://www.youtube.com/watch?v=V8qlIZsutAQ
  trailer = Video.create(md5: '7103d9df82c8536c9c8d187bc62f1547', duration: 136.185, videotype: 'trailer', videosrc: 'http://r1---sn-q4f7snek.googlevideo.com/videoplayback?mime=video%2Fmp4&source=youtube&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Csource%2Cupn%2Cexpire&fexp=9407610%2C9416126%2C9419451%2C9420452%2C9420716%2C9421932%2C9422428%2C9422596%2C9422918%2C9423639%2C9423662%2C9423714%2C9424372%2C9424630%2C9424753&itag=22&expire=1450456469&mm=31&mn=sn-q4f7snek&dur=136.231&mt=1450434755&mv=m&ms=au&lmt=1445406698284638&ip=2a03%3A8180%3A1001%3A16a%3A%3A8ee1&key=yt6&ipbits=0&id=o-ABIK8SUHxYOstxomhBFWDmSoQ5SkUJGg9BgiO-GXBBGy&upn=AvrmcAlpQq8&initcwndbps=9311250&ratebypass=yes&nh=IgpwcjA1LmRmdzA2KgkxMjcuMC4wLjE&pl=40&signature=A1803C80D28AE29C6EB65319B69E8CB4F3112236.CCF629CBD36BA73267B0927F74981A6FFD1F4480&sver=3&title=Star+Wars%3A+El+Despertar+de+la+Fuerza+Tr%C3%A1iler+Espa%C3%B1a+%7C+Oficial+HD', audiosrc: nil)
]

videos_login.each {|video| video.save}

user = User.create(nickname: 'prueba', email: 'prueba@gmail.com', gender: 'male', role: 'user', password: '12345678')
user.save
video = Video.all.order('RANDOM()').first

positions = [
#  'line:20 align:start',
#  'line:20 align:end',
#  'line:90 align:start',
  'line:90 align:end',
#  'line:50 align:middle',
#  'line:50 align:start',
#  'line:50 align:end'
]

comentarios = {
  asco: [
    'alguien paga para ver esto?',
    'verguenza ajena',
    'estoy por pedirle a mi madre q me de dos tiros',
    'queda mucho para el final?'
    ],
  hate: [
    'sois unos putos borregos',
    'me cago en todos!',
    'voy a sacar el hacha y me cargo a varios',
    'iros todos a la puta mierda'
    ],
  like: [
    'espero q salga pronto en dvd',
    'me encanta esta parte',
    'no pensaba q iba a estar tan divertida',
    'jajajajaja'
    ],
  sad: [
    'pq nunca me pasan estas cosas a mi?',
    'nadie comenta?',
    'hola, estoy aquí',
    'nadie me hace caso'
    ],
  love: [
    'me he quedao bobita perdida',
    'te comería todos los morros',
    'dónde están hombres como estos?',
    'q linda, para achucharla'
    ],
  dato: [
    'esto es un plano cenital',
    'el blanco es la suma de todos los colores',
    'los delfines no tienen olfato',
    'hay 4 gramos de levadura en la orina'
    ]
}

coment_class = %w{asco hate like sad love dato}

videos_login.each do |video|
  40.times do 
    rand_coment_class = rand(0..coment_class.size-1)
    cue = Cue.create(user_id: user.id, video_id: video.id, starttime: rand(0..video.duration.round), text: comentarios[coment_class[rand_coment_class].to_sym][rand(0..3)], cueid: 'prueba', cssclass: coment_class[rand_coment_class], position: positions[rand(0..positions.size-1)])
    cue.save
  end
end