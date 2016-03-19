# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_10mb.mp4

videos_login = [
  # http://en.savefrom.net/
  # All_About_The_Woman_Agent_Provocateur_AW15_Lookbook_hd720.mp4 - https://www.youtube.com/watch?v=fv8JEcQa_To
  sexy = Video.create(md5: '6d041328aca5f70e02b6dd0bfc71a837', duration: 41.261666, videotype: 'sexy', videosrc: 'https://www.youtube.com/watch?v=fv8JEcQa_To', audiosrc: nil),
  # 'knew' abstract portrait painting.mp4 - https://www.youtube.com/watch?v=0CaKtbL-NfM
  videoart = Video.create(md5: 'fbde5c6b6c2f8e79f2d84b411941c402', duration: 208.258, videotype: 'videoart', videosrc: 'https://www.youtube.com/watch?v=0CaKtbL-NfM', audiosrc: nil),
  # El_vuelo_de_TransAsia_235_hd720.mp4 - https://www.youtube.com/watch?v=J0QoWR-3Tm4
  news = Video.create(md5: 'be1c00b6efef2ab3a4ded6b772d1d7d3', duration: 51.64, videotype: 'news', videosrc: 'https://www.youtube.com/watch?v=J0QoWR-3Tm4', audiosrc: nil),
  # NOWNESS_hd720.mp4 - https://www.youtube.com/watch?v=Pt0AvOLLXRc
  comercial1 = Video.create(md5: 'a46d4d8d4861e5f76ce6913e55c43b44', duration: 35.896666, videotype: 'comercial', videosrc: 'https://www.youtube.com/watch?v=Pt0AvOLLXRc', audiosrc: nil),
  # Director_s_Cuts_Cara_Delevingne_in_Cara_by_Matthew_Donaldson_hd720.mp4 - https://www.youtube.com/watch?v=qySnMR8W2gE
  comercial2 = Video.create(md5: '541115815455bcab45097a16f5421f54', duration: 109.968, videotype: 'comercial', videosrc: 'https://www.youtube.com/watch?v=qySnMR8W2gE', audiosrc: nil),
  # Florence_The_Machine_Shake_It_Out_hd720.mp4 - https://www.youtube.com/watch?v=WbN0nX61rIs
  videoclip = Video.create(md5: 'f8e4ea8587f18f1f1566930220ff030b', duration: 281.89, videotype: 'videoclip', videosrc: 'https://www.youtube.com/watch?v=WbN0nX61rIs', audiosrc: nil),
  # Star_Wars_El_Despertar_de_la_Fuerza_Tráiler_España_Oficial_HD_hd720.mp4 - https://www.youtube.com/watch?v=V8qlIZsutAQ
  trailer = Video.create(md5: '7103d9df82c8536c9c8d187bc62f1547', duration: 136.185, videotype: 'trailer', videosrc: 'https://www.youtube.com/watch?v=V8qlIZsutAQ', audiosrc: nil)
]

videos_login.each {|video| video.save}

user = User.create(nickname: 'prueba', email: 'prueba@gmail.com', gender: 'male', role: 'user', password: '12345678')
user.save
#video = Video.all.order('RANDOM()').first

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
  20.times do 
    rand_coment_class = rand(0..coment_class.size-1)
    cue = Cue.create(user_id: user.id, video_id: video.id, starttime: rand(0..video.duration.round), text: comentarios[coment_class[rand_coment_class].to_sym][rand(0..3)], cueid: 'prueba', cssclass: coment_class[rand_coment_class], position: positions[rand(0..positions.size-1)])
    cue.save
  end
end