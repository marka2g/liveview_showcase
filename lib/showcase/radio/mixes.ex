defmodule Showcase.Radio.Mixes do
  def all do
    [
      %{
        id: 1,
        title: "Burning Man Mix",
        url:
          "https://my-mixes.s3.us-west-1.amazonaws.com/burning_man_launch_drive_mix_markOnTheMake_2022-08-25_15h14m37.wav",
        release_date: ~U[2022-08-25 12:00:00.003Z],
        image_url: "https://my-mixes.s3.us-west-1.amazonaws.com/tape.png"
      },
      %{
        id: 2,
        title: "Mix for Juan & Anna",
        url: "https://my-mixes.s3.us-west-1.amazonaws.com/mix_4_juanzo_p1_resampled_1.mp3",
        release_date: ~U[2019-07-28 12:00:00.003Z],
        image_url: "https://my-mixes.s3.us-west-1.amazonaws.com/tape.png"
      },
      %{
        id: 3,
        title: "CybexIndustries Mix",
        url: "https://my-mixes.s3.us-west-1.amazonaws.com/450n7h3Cy83x_mix.wav",
        release_date: ~U[2019-08-21 12:00:00.003Z],
        image_url: "https://my-mixes.s3.us-west-1.amazonaws.com/tape.png"
      },
      %{
        id: 4,
        title: "Cryptotronic Mix",
        url:
          "https://my-mixes.s3.us-west-1.amazonaws.com/CybotronIndustriesMix_2nd_attempt_at_mix_dev_mix_2021-04-29_22h12m33.wav",
        release_date: ~U[2019-08-21 12:00:00.003Z],
        image_url: "https://my-mixes.s3.us-west-1.amazonaws.com/tape.png"
      },
      %{
        id: 5,
        title: "SuperMoon Mix",
        url: "https://my-mixes.s3.us-west-1.amazonaws.com/SuperMoonMix.wav",
        release_date: ~U[2019-08-21 12:00:00.003Z],
        image_url: "https://my-mixes.s3.us-west-1.amazonaws.com/tape.png"
      },
      %{
        id: 6,
        title: "PiensoEnTi Mix",
        url: "https://my-mixes.s3.us-west-1.amazonaws.com/PiensoEnTi_mix.mp3",
        release_date: ~U[2015-05-06 12:00:00.003Z],
        image_url: "https://my-mixes.s3.us-west-1.amazonaws.com/tape.png"
      },
      %{
        id: 7,
        title: "Americah Mix",
        url: "https://my-mixes.s3.us-west-1.amazonaws.com/01+Americah_MarkAttitudeMix.mp3",
        release_date: ~U[2014-09-26 12:00:00.003Z],
        image_url: "https://my-mixes.s3.us-west-1.amazonaws.com/tape.png"
      }
    ]
  end

  def get_by(title: title) do
    Enum.find(all(), &(&1.title == title))
  end

  def get_by(id: id) do
    Enum.find(all(), &(&1.id == id))
  end
end
