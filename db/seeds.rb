one_dirc = Band.create!(name: "One Direction")
beatles = Band.create!(name: "Beatles")

one_dirc_album = Album.create!(name: "Midnight Memories", band_id: one_dirc.id, kind: "Studio")
beatles_album = Album.create!(name: "Let It Be", band_id: beatles.id, kind: "Studio")
