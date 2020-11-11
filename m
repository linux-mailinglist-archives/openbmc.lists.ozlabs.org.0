Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 979C02AF493
	for <lists+openbmc@lfdr.de>; Wed, 11 Nov 2020 16:17:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWSy4006BzDql5
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 02:16:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::833;
 helo=mail-qt1-x833.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=RuS/Fps5; dkim-atps=neutral
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWSwj1bzFzDqFt
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2020 02:15:46 +1100 (AEDT)
Received: by mail-qt1-x833.google.com with SMTP id f93so1472068qtb.10
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 07:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JFjU8VfNraTDkPNhSPK6ecGj9m5/HszBuCC8po4fAJU=;
 b=RuS/Fps5Ye4C/KhSCvLarbJBzpATmSQXDm4GUt1PuADMbFC/Zpp5y7CdaShlnlkfv7
 DrOG57YNfaq6VQHMpXPqRkjhbXQmNWQHF0r3ANubeF1XXDHn1zBT68woJyUbPf1p7XQ2
 7lWGFFcqwPOQkGCbf0JZwYHq0nFkudhUjcyCU+/iDSaerRPNtu4Fy3hlDJgycygxZDe6
 +KAgjMcn+tyANcqmHY0ZXR3ehOyDZzEoopSaOhVvprWcEC7Xdsd8qDT2MxN1ATCA0UUL
 EyQPHgCwrX64j1nCb7F00Oml/BtUBUUNpJNLeYdu4SrQi7PaOap27T41QESCeEDmItQX
 aTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JFjU8VfNraTDkPNhSPK6ecGj9m5/HszBuCC8po4fAJU=;
 b=fFMyV0cyu3OR/uXZhWPUflNCbnwfbsie/SJXf47SHJF0CzF95r4mLrbmoWMeli82Hh
 +23XT+JNz/yjeibHiKlLBvyAdHgNb3KTf5I6SZMhrH/kR7ob50kkolPlFr3q8CA3FAb0
 9kP4rMuxs2Su5L4dExkQS1LiSKKDeyZxqsm6KrOwnIcs1wt53pOEuzMex2maeUW60Hxc
 Q2LlG4qqaRR20PrTiwQjVtYGUmvWozVWMJaBYy4SSN3TeeQ2tT3GpspVU5cjfhFi5AZD
 kuNZl2GWwVmJuWslzmvgkt0s2GZLcAT+V2nyB8VCO7YQsYcsxfWh/i7WBwaz6KMQ/WMB
 f6WQ==
X-Gm-Message-State: AOAM530drrCW6rvhil9UhXIs/SywmjAcNNkGclfugYB02q9FHTmdRRH9
 artdm/wP0rckIduCrBTtUCw/G1jNp3I2DhO9zVNYaw==
X-Google-Smtp-Source: ABdhPJy7VHOnsyRR/No/Y2NWpjeIjICnaAAS4hbWr7E0E/y35doGgocjyoj70piwBWglPDT2knXrVj/3CSdpem3NzDM=
X-Received: by 2002:ac8:7083:: with SMTP id y3mr23953033qto.248.1605107742048; 
 Wed, 11 Nov 2020 07:15:42 -0800 (PST)
MIME-Version: 1.0
References: <CAGm54UH407RGGHmrbqUvWDy3ozXx08NQCNiW2E4qs576kwB67g@mail.gmail.com>
 <HK2PR04MB3826F0E0E2F9CA1A041DFC5DFE610@HK2PR04MB3826.apcprd04.prod.outlook.com>
 <OF1D7ABF81.CDBAD648-ON002585A5.0017F478-002585A5.0018BAEF@notes.na.collabserv.com>
 <SY2PR01MB2410CFE5E559B0F8CDEA25DDFE340@SY2PR01MB2410.ausprd01.prod.outlook.com>
 <MEAPR01MB24061B5B8759322BD1C71950FE340@MEAPR01MB2406.ausprd01.prod.outlook.com>
In-Reply-To: <MEAPR01MB24061B5B8759322BD1C71950FE340@MEAPR01MB2406.ausprd01.prod.outlook.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 11 Nov 2020 07:15:30 -0800
Message-ID: <CAO=noty2jQdnWKp+tT52V9+OH6RH0C8uykqaTvOz2sPQ8cE5HQ@mail.gmail.com>
Subject: Re: about pid speed control
To: =?UTF-8?B?5ZGoIOi/nOa4hQ==?= <zhouyuanqing8@outlook.com>, 
 Josh Lehan <krellan@google.com>
Content-Type: multipart/alternative; boundary="000000000000cb1cc905b3d644b3"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: "uperic@163.com" <uperic@163.com>, openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000cb1cc905b3d644b3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2020 at 6:27 AM =E5=91=A8 =E8=BF=9C=E6=B8=85 <zhouyuanqing8=
@outlook.com> wrote:

> Hi everyone,
>
>           For the parameters of the following table, does the PID code of
> openbmc have a clearer transfer function corresponding to this table? By
> adjusting the following parameters, fancontrol has taken effect. I set 50=
00
> rpm, but the fan will change back and forth between 4500-5500. The change
> in this range is still relatively large. If there is a transfer function,
> the adjustment will be more accurate and faster.
>
>
> https://github.com/openbmc/phosphor-pid-control/blob/master/configure.md
> <https://github.com/openbmc/phosphor-pid-control/blob/master/configure.md=
>
> openbmc/phosphor-pid-control
> <https://github.com/openbmc/phosphor-pid-control/blob/master/configure.md=
>
> OpenBMC PID-based Thermal Control Daemon. Contribute to
> openbmc/phosphor-pid-control development by creating an account on GitHub=
.
> github.com
>
> field type meaning
> samplePeriod double How frequently the value is sampled. 0.1 for fans,
> 1.0 for temperatures.
> proportionalCoeff double The proportional coefficient.
> integralCoeff double The integral coefficient.
> feedFwdOffsetCoeff double The feed forward offset coefficient.
> feedFwdGainCoeff double The feed forward gain coefficient.
> integralLimit_min double The integral minimum clamp value.
> integralLimit_max double The integral maximum clamp value.
> outLim_min double The output minimum clamp value.
> outLim_max double The output maximum clamp value.
> slewNeg double Negative slew value to dampen output.
> slewPos double Positive slew value to accelerate output.
>
+Josh Lehan <krellan@google.com> for input.

>
>
> ------------------------------
> *=E5=8F=91=E4=BB=B6=E4=BA=BA:* =E5=91=A8 =E8=BF=9C=E6=B8=85 <zhouyuanqing=
8@outlook.com>
> *=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:* 2020=E5=B9=B49=E6=9C=8827=E6=97=
=A5 11:17
> *=E6=94=B6=E4=BB=B6=E4=BA=BA:* openbmc <openbmc@lists.ozlabs.org>
> *=E6=8A=84=E9=80=81:* uperic@163.com <uperic@163.com>
> *=E4=B8=BB=E9=A2=98:* about pid speed control
>
> Hi everyone,
>
>     I added the phophor-pid-control module to my project. After the PID
> module was started, the pwm value oscillated between 12 and 153. I delete=
d
> other configurations and only kept one fan and one temp. I have debugged
> various PID parameter values of fan, and there is no obvious change in th=
e
> phenomenon. Please take a look at it, thank you.
>
>    The configuration is as follows:
>
>    4611 root      7616 S    /usr/bin/swampd -t -l /tmp/
>
>    root@starlake-sn:~# cat /etc/thermal.d/setpoint
>    3000
>
>    config.json as follow:
>    {
>     "sensors" : [
>         {
>             "name": "Fan0_Speed",
>             "type": "fan",
>             "readPath":
> "/xyz/openbmc_project/sensors/fan_tach/Fan0_Speed",
>             "writePath":
> "/xyz/openbmc_project/sensors/fan_tach/Fan0_Speed",
>             "min": 0,
>             "max": 255,
>             "timeout": 0
>         },
>         {
>             "name": "inlet_Temp",
>             "type": "temp",
>             "readPath":
> "/xyz/openbmc_project/sensors/temperature/inlet_Temp",
>             "writePath": "",
>             "min": 0,
>             "max": 0,
>             "ignoreDbusMinMax": true,
>             "timeout": 0
>         }
>     ],
>   "zones" : [
>         {
>             "id": 1,
>             "minThermalOutput": 3000.0,
>             "failsafePercent": 75.0,
>             "pids": [
>                 {
>                     "name": "Fan0_Speed",
>                     "type": "fan",
>                     "inputs": ["Fan0_Speed"],
>                     "setpoint": 50.0,
>                     "pid": {
>                         "samplePeriod": 0.1,
>                         "proportionalCoeff": 20.0,
>                         "integralCoeff": 0.1,
>                         "feedFwdOffsetCoeff": 0.0,
>                         "feedFwdGainCoeff": 1.0,
>                         "integralLimit_min": 0.0,
>                         "integralLimit_max": 5.0,
>                         "outLim_min": 5.0,
>                         "outLim_max": 60.0,
>                         "slewNeg": 0.0,
>                         "slewPos": 0.0
>                     }
>                 },
>                 {
>                     "name": "inlet_Temp",
>                     "type": "temp",
>                     "inputs": ["inlet_Temp"],
>                     "setpoint": 50.0,
>                     "pid": {                      amplePeriod": 0.1,
>                         "samplePeriod": 1.0,
>                         "proportionalCoeff": -0.1,
>                         "integralCoeff": 1.0,     36;34Hin": 5.0,
>                         "feedFwdOffsetCoeff": 0.0,
>                         "feedFwdGainCoeff": 0.0,
>                         "integralLimit_min": 0.0,
>                         "integralLimit_max": 0.0,
>                         "outLim_min": 3000.0,
>                         "outLim_max": 16000.0,
>                         "slewNeg": 0.0,
>                         "slewPos": 0.0,
>                         "positiveHysteresis": 1.0,
>                         "negativeHysteresis": 1.0
>                     }
>            }
>             ]
>         }
>     ]
> }
>

--000000000000cb1cc905b3d644b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, Sep 27, 2020 at 6:27 AM =E5=91=A8=
 =E8=BF=9C=E6=B8=85 &lt;<a href=3D"mailto:zhouyuanqing8@outlook.com">zhouyu=
anqing8@outlook.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">




<div dir=3D"ltr">
<div>
<div id=3D"gmail-m_-6430746694988440840appendonsend" style=3D"font-family:C=
alibri,Arial,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;background-co=
lor:rgb(255,255,255);display:inline">Hi everyone,</span><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;background-co=
lor:rgb(255,255,255);display:inline"><br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;background-co=
lor:rgb(255,255,255);display:inline">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=
=A0For the parameters of the following table, does the PID code of openbmc =
have a clearer transfer function corresponding
 to this table? By adjusting the following parameters, fancontrol has taken=
 effect. I set 5000 rpm, but the fan will change back and forth between 450=
0-5500. The change in this range is still relatively large. If there is a t=
ransfer function, the adjustment
 will be more accurate and faster.</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;background-co=
lor:rgb(255,255,255);display:inline"><br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<a href=3D"https://github.com/openbmc/phosphor-pid-control/blob/master/conf=
igure.md" id=3D"gmail-m_-6430746694988440840LPlnk" target=3D"_blank">https:=
//github.com/openbmc/phosphor-pid-control/blob/master/configure.md</a><br>
<div>
<div id=3D"gmail-m_-6430746694988440840LPBorder_GTaHR0cHM6Ly9naXRodWIuY29tL=
29wZW5ibWMvcGhvc3Bob3ItcGlkLWNvbnRyb2wvYmxvYi9tYXN0ZXIvY29uZmlndXJlLm1k" st=
yle=3D"width:100%;margin-top:16px;margin-bottom:16px;max-width:800px;min-wi=
dth:424px">
<table id=3D"gmail-m_-6430746694988440840LPContainer771081" style=3D"paddin=
g:12px 36px 12px 12px;width:100%;border-width:1px;border-style:solid;border=
-color:rgb(200,200,200);border-radius:2px">
<tbody>
<tr valign=3D"top" style=3D"border-spacing:0px">
<td>
<div id=3D"gmail-m_-6430746694988440840LPImageContainer771081" style=3D"mar=
gin-right:12px;height:160px;overflow:hidden">
<a id=3D"gmail-m_-6430746694988440840LPImageAnchor771081" href=3D"https://g=
ithub.com/openbmc/phosphor-pid-control/blob/master/configure.md" target=3D"=
_blank"><img id=3D"gmail-m_-6430746694988440840LPThumbnailImageId771081" al=
t=3D"" height=3D"160" style=3D"display: block;" width=3D"160" src=3D"https:=
//avatars3.githubusercontent.com/u/13670043?s=3D400&amp;v=3D4"></a></div>
</td>
<td style=3D"width:100%">
<div id=3D"gmail-m_-6430746694988440840LPTitle771081" style=3D"font-size:21=
px;font-weight:300;margin-right:8px;font-family:wf_segoe-ui_light,&quot;Seg=
oe UI Light&quot;,&quot;Segoe WP Light&quot;,&quot;Segoe UI&quot;,&quot;Seg=
oe WP&quot;,Tahoma,Arial,sans-serif;margin-bottom:12px">
<a id=3D"gmail-m_-6430746694988440840LPUrlAnchor771081" href=3D"https://git=
hub.com/openbmc/phosphor-pid-control/blob/master/configure.md" style=3D"tex=
t-decoration:none" target=3D"_blank">openbmc/phosphor-pid-control</a></div>
<div id=3D"gmail-m_-6430746694988440840LPDescription771081" style=3D"font-s=
ize:14px;max-height:100px;color:rgb(102,102,102);font-family:wf_segoe-ui_no=
rmal,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif;marg=
in-bottom:12px;margin-right:8px;overflow:hidden">
OpenBMC PID-based Thermal Control Daemon. Contribute to openbmc/phosphor-pi=
d-control development by creating an account on GitHub.</div>
<div id=3D"gmail-m_-6430746694988440840LPMetadata771081" style=3D"font-size=
:14px;font-weight:400;color:rgb(166,166,166);font-family:wf_segoe-ui_normal=
,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif">
<a href=3D"http://github.com" target=3D"_blank">github.com</a></div>
</td>
</tr>
</tbody>
</table>
</div>
</div>
<br>
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;background-co=
lor:rgb(255,255,255);display:inline">
<table style=3D"box-sizing:border-box;border-spacing:0px;border-collapse:co=
llapse;margin-top:0px;margin-bottom:16px;display:block;width:max-content;ma=
x-width:100%;overflow:auto;color:rgb(36,41,46);font-family:-apple-system,Bl=
inkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Appl=
e Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-weight:normal">
<thead style=3D"box-sizing:border-box">
<tr style=3D"box-sizing:border-box;background-color:rgb(255,255,255);border=
-top:1px solid rgb(198,203,209)">
<th style=3D"box-sizing:border-box;padding:6px 13px;font-weight:600;border:=
1px solid rgb(223,226,229)">
field</th>
<th style=3D"box-sizing:border-box;padding:6px 13px;font-weight:600;border:=
1px solid rgb(223,226,229)">
type</th>
<th style=3D"box-sizing:border-box;padding:6px 13px;font-weight:600;border:=
1px solid rgb(223,226,229)">
meaning</th>
</tr>
</thead>
<tbody style=3D"box-sizing:border-box">
<tr style=3D"box-sizing:border-box;background-color:rgb(255,255,255);border=
-top:1px solid rgb(198,203,209)">
<td style=3D"box-sizing:border-box;padding:6px 13px;border:1px solid rgb(22=
3,226,229)">
<code style=3D"box-sizing:border-box;font-family:SFMono-Regular,Consolas,&q=
uot;Liberation Mono&quot;,Menlo,monospace;font-size:13.6px;padding:0.2em 0.=
4em;margin:0px;background-color:rgba(27,31,35,0.05);border-radius:6px">samp=
lePeriod</code></td>
<td style=3D"box-sizing:border-box;padding:6px 13px;border:1px solid rgb(22=
3,226,229)">
<code style=3D"box-sizing:border-box;font-family:SFMono-Regular,Consolas,&q=
uot;Liberation Mono&quot;,Menlo,monospace;font-size:13.6px;padding:0.2em 0.=
4em;margin:0px;background-color:rgba(27,31,35,0.05);border-radius:6px">doub=
le</code></td>
<td style=3D"box-sizing:border-box;padding:6px 13px;border:1px solid rgb(22=
3,226,229)">
How frequently the value is sampled. 0.1 for fans, 1.0 for temperatures.</t=
d>
</tr>
<tr style=3D"box-sizing:border-box;background-color:rgb(246,248,250);border=
-top:1px solid rgb(198,203,209)">
<td style=3D"box-sizing:border-box;padding:6px 13px;border:1px solid rgb(22=
3,226,229)">
<code style=3D"box-sizing:border-box;font-family:SFMono-Regular,Consolas,&q=
uot;Liberation Mono&quot;,Menlo,monospace;font-size:13.6px;padding:0.2em 0.=
4em;margin:0px;background-color:rgba(27,31,35,0.05);border-radius:6px">prop=
ortionalCoeff</code></td>
<td style=3D"box-sizing:border-box;padding:6px 13px;border:1px solid rgb(22=
3,226,229)">
<code style=3D"box-sizing:border-box;font-family:SFMono-Regular,Consolas,&q=
uot;Liberation Mono&quot;,Menlo,monospace;font-size:13.6px;padding:0.2em 0.=
4em;margin:0px;background-color:rgba(27,31,35,0.05);border-radius:6px">doub=
le</code></td>
<td style=3D"box-sizing:border-box;padding:6px 13px;border:1px solid rgb(22=
3,226,229)">
The proportional coefficient.</td>
</tr>
<tr style=3D"box-sizing:border-box;background-color:rgb(255,255,255);border=
-top:1px solid rgb(198,203,209)">
<td style=3D"box-sizing:border-box;padding:6px 13px;border:1px solid rgb(22=
3,226,229)">
<code style=3D"box-sizing:border-box;font-family:SFMono-Regular,Consolas,&q=
uot;Liberation Mono&quot;,Menlo,monospace;font-size:13.6px;padding:0.2em 0.=
4em;margin:0px;background-color:rgba(27,31,35,0.05);border-radius:6px">inte=
gralCoeff</code></td>
<td style=3D"box-sizing:border-box;padding:6px 13px;border:1px solid rgb(22=
3,226,229)">
<code style=3D"box-sizing:border-box;font-family:SFMono-Regular,Consolas,&q=
uot;Liberation Mono&quot;,Menlo,monospace;font-size:13.6px;padding:0.2em 0.=
4em;margin:0px;background-color:rgba(27,31,35,0.05);border-radius:6px">doub=
le</code></td>
<td style=3D"box-sizing:border-box;padding:6px 13px;border:1px solid rgb(22=
3,226,229)">
The integral coefficient.</td>
</tr>
<tr style=3D"box-sizing:border-box;background-color:rgb(246,248,250);border=
-top:1px solid rgb(198,203,209)">
<td style=3D"box-sizing:border-box;padding:6px 13px;border:1px solid rgb(22=
3,226,229)">
<code style=3D"box-sizing:border-box;font-family:SFMono-Regular,Consolas,&q=
uot;Liberation Mono&quot;,Menlo,monospace;font-size:13.6px;padding:0.2em 0.=
4em;margin:0px;background-color:rgba(27,31,35,0.05);border-radius:6px">feed=
FwdOffsetCoeff</code></td>
<td style=3D"box-sizing:border-box;padding:6px 13px;border:1px solid rgb(22=
3,226,229)">
<code style=3D"box-sizing:border-box;font-family:SFMono-Regular,Consolas,&q=
uot;Liberation Mono&quot;,Menlo,monospace;font-size:13.6px;padding:0.2em 0.=
4em;margin:0px;background-color:rgba(27,31,35,0.05);border-radius:6px">doub=
le</code></td>
<td style=3D"box-sizing:border-box;padding:6px 13px;border:1px solid rgb(22=
3,226,229)">
The feed forward offset coefficient.</td>
</tr>
<tr style=3D"box-sizing:border-box;background-color:rgb(255,255,255);border=
-top:1px solid rgb(198,203,209)">
<td style=3D"box-sizing:border-box;padding:6px 13px;border:1px solid rgb(22=
3,226,229)">
<code style=3D"box-sizing:border-box;font-family:SFMono-Regular,Consolas,&q=
uot;Liberation Mono&quot;,Menlo,monospace;font-size:13.6px;padding:0.2em 0.=
4em;margin:0px;background-color:rgba(27,31,35,0.05);border-radius:6px">feed=
FwdGainCoeff</code></td>
<td style=3D"box-sizing:border-box;padding:6px 13px;border:1px solid rgb(22=
3,226,229)">
<code style=3D"box-sizing:border-box;font-family:SFMono-Regular,Consolas,&q=
uot;Liberation Mono&quot;,Menlo,monospace;font-size:13.6px;padding:0.2em 0.=
4em;margin:0px;background-color:rgba(27,31,35,0.05);border-radius:6px">doub=
le</code></td>
<td style=3D"box-sizing:border-box;padding:6px 13px;border:1px solid rgb(22=
3,226,229)">
The feed forward gain coefficient.</td>
</tr>
<tr style=3D"box-sizing:border-box;background-color:rgb(246,248,250);border=
-top:1px solid rgb(198,203,209)">
<td style=3D"box-sizing:border-box;padding:6px 13px;border:1px solid rgb(22=
3,226,229)">
<code style=3D"box-sizing:border-box;font-family:SFMono-Regular,Consolas,&q=
uot;Liberation Mono&quot;,Menlo,monospace;font-size:13.6px;padding:0.2em 0.=
4em;margin:0px;background-color:rgba(27,31,35,0.05);border-radius:6px">inte=
gralLimit_min</code></td>
<td style=3D"box-sizing:border-box;padding:6px 13px;border:1px solid rgb(22=
3,226,229)">
<code style=3D"box-sizing:border-box;font-family:SFMono-Regular,Consolas,&q=
uot;Liberation Mono&quot;,Menlo,monospace;font-size:13.6px;padding:0.2em 0.=
4em;margin:0px;background-color:rgba(27,31,35,0.05);border-radius:6px">doub=
le</code></td>
<td style=3D"box-sizing:border-box;padding:6px 13px;border:1px solid rgb(22=
3,226,229)">
The integral minimum clamp value.</td>
</tr>
<tr style=3D"box-sizing:border-box;background-color:rgb(255,255,255);border=
-top:1px solid rgb(198,203,209)">
<td style=3D"box-sizing:border-box;padding:6px 13px;border:1px solid rgb(22=
3,226,229)">
<code style=3D"box-sizing:border-box;font-family:SFMono-Regular,Consolas,&q=
uot;Liberation Mono&quot;,Menlo,monospace;font-size:13.6px;padding:0.2em 0.=
4em;margin:0px;background-color:rgba(27,31,35,0.05);border-radius:6px">inte=
gralLimit_max</code></td>
<td style=3D"box-sizing:border-box;padding:6px 13px;border:1px solid rgb(22=
3,226,229)">
<code style=3D"box-sizing:border-box;font-family:SFMono-Regular,Consolas,&q=
uot;Liberation Mono&quot;,Menlo,monospace;font-size:13.6px;padding:0.2em 0.=
4em;margin:0px;background-color:rgba(27,31,35,0.05);border-radius:6px">doub=
le</code></td>
<td style=3D"box-sizing:border-box;padding:6px 13px;border:1px solid rgb(22=
3,226,229)">
The integral maximum clamp value.</td>
</tr>
<tr style=3D"box-sizing:border-box;background-color:rgb(246,248,250);border=
-top:1px solid rgb(198,203,209)">
<td style=3D"box-sizing:border-box;padding:6px 13px;border:1px solid rgb(22=
3,226,229)">
<code style=3D"box-sizing:border-box;font-family:SFMono-Regular,Consolas,&q=
uot;Liberation Mono&quot;,Menlo,monospace;font-size:13.6px;padding:0.2em 0.=
4em;margin:0px;background-color:rgba(27,31,35,0.05);border-radius:6px">outL=
im_min</code></td>
<td style=3D"box-sizing:border-box;padding:6px 13px;border:1px solid rgb(22=
3,226,229)">
<code style=3D"box-sizing:border-box;font-family:SFMono-Regular,Consolas,&q=
uot;Liberation Mono&quot;,Menlo,monospace;font-size:13.6px;padding:0.2em 0.=
4em;margin:0px;background-color:rgba(27,31,35,0.05);border-radius:6px">doub=
le</code></td>
<td style=3D"box-sizing:border-box;padding:6px 13px;border:1px solid rgb(22=
3,226,229)">
The output minimum clamp value.</td>
</tr>
<tr style=3D"box-sizing:border-box;background-color:rgb(255,255,255);border=
-top:1px solid rgb(198,203,209)">
<td style=3D"box-sizing:border-box;padding:6px 13px;border:1px solid rgb(22=
3,226,229)">
<code style=3D"box-sizing:border-box;font-family:SFMono-Regular,Consolas,&q=
uot;Liberation Mono&quot;,Menlo,monospace;font-size:13.6px;padding:0.2em 0.=
4em;margin:0px;background-color:rgba(27,31,35,0.05);border-radius:6px">outL=
im_max</code></td>
<td style=3D"box-sizing:border-box;padding:6px 13px;border:1px solid rgb(22=
3,226,229)">
<code style=3D"box-sizing:border-box;font-family:SFMono-Regular,Consolas,&q=
uot;Liberation Mono&quot;,Menlo,monospace;font-size:13.6px;padding:0.2em 0.=
4em;margin:0px;background-color:rgba(27,31,35,0.05);border-radius:6px">doub=
le</code></td>
<td style=3D"box-sizing:border-box;padding:6px 13px;border:1px solid rgb(22=
3,226,229)">
The output maximum clamp value.</td>
</tr>
<tr style=3D"box-sizing:border-box;background-color:rgb(246,248,250);border=
-top:1px solid rgb(198,203,209)">
<td style=3D"box-sizing:border-box;padding:6px 13px;border:1px solid rgb(22=
3,226,229)">
<code style=3D"box-sizing:border-box;font-family:SFMono-Regular,Consolas,&q=
uot;Liberation Mono&quot;,Menlo,monospace;font-size:13.6px;padding:0.2em 0.=
4em;margin:0px;background-color:rgba(27,31,35,0.05);border-radius:6px">slew=
Neg</code></td>
<td style=3D"box-sizing:border-box;padding:6px 13px;border:1px solid rgb(22=
3,226,229)">
<code style=3D"box-sizing:border-box;font-family:SFMono-Regular,Consolas,&q=
uot;Liberation Mono&quot;,Menlo,monospace;font-size:13.6px;padding:0.2em 0.=
4em;margin:0px;background-color:rgba(27,31,35,0.05);border-radius:6px">doub=
le</code></td>
<td style=3D"box-sizing:border-box;padding:6px 13px;border:1px solid rgb(22=
3,226,229)">
Negative slew value to dampen output.</td>
</tr>
<tr style=3D"box-sizing:border-box;background-color:rgb(255,255,255);border=
-top:1px solid rgb(198,203,209)">
<td style=3D"box-sizing:border-box;padding:6px 13px;border:1px solid rgb(22=
3,226,229)">
<code style=3D"box-sizing:border-box;font-family:SFMono-Regular,Consolas,&q=
uot;Liberation Mono&quot;,Menlo,monospace;font-size:13.6px;padding:0.2em 0.=
4em;margin:0px;background-color:rgba(27,31,35,0.05);border-radius:6px">slew=
Pos</code></td>
<td style=3D"box-sizing:border-box;padding:6px 13px;border:1px solid rgb(22=
3,226,229)">
<code style=3D"box-sizing:border-box;font-family:SFMono-Regular,Consolas,&q=
uot;Liberation Mono&quot;,Menlo,monospace;font-size:13.6px;padding:0.2em 0.=
4em;margin:0px;background-color:rgba(27,31,35,0.05);border-radius:6px">doub=
le</code></td>
<td style=3D"box-sizing:border-box;padding:6px 13px;border:1px solid rgb(22=
3,226,229)">
Positive slew value to accelerate output.</td>
</tr>
</tbody>
</table>
<br></span></div></div></div></blockquote><div><a class=3D"gmail_plusreply"=
 id=3D"gmail-plusReplyChip-0" href=3D"mailto:krellan@google.com" tabindex=
=3D"-1">+Josh Lehan</a>=C2=A0for input.=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr"><div><div style=3D"font-family:C=
alibri,Arial,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)"><span st=
yle=3D"font-family:Calibri,Arial,Helvetica,sans-serif;background-color:rgb(=
255,255,255);display:inline">
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"gmail-m_-6430746694988440840divRplyFwdMsg" dir=3D"ltr"><font fac=
e=3D"Calibri, sans-serif" color=3D"#000000" style=3D"font-size:11pt"><b>=E5=
=8F=91=E4=BB=B6=E4=BA=BA:</b> =E5=91=A8 =E8=BF=9C=E6=B8=85 &lt;<a href=3D"m=
ailto:zhouyuanqing8@outlook.com" target=3D"_blank">zhouyuanqing8@outlook.co=
m</a>&gt;<br>
<b>=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:</b> 2020=E5=B9=B49=E6=9C=8827=E6=
=97=A5 11:17<br>
<b>=E6=94=B6=E4=BB=B6=E4=BA=BA:</b> openbmc &lt;<a href=3D"mailto:openbmc@l=
ists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>
<b>=E6=8A=84=E9=80=81:</b> <a href=3D"mailto:uperic@163.com" target=3D"_bla=
nk">uperic@163.com</a> &lt;<a href=3D"mailto:uperic@163.com" target=3D"_bla=
nk">uperic@163.com</a>&gt;<br>
<b>=E4=B8=BB=E9=A2=98:</b> about pid speed control</font>
<div>=C2=A0</div>
</div>
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Hi everyone,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
=C2=A0 =C2=A0=C2=A0I added the phophor-pid-control module to my project. Af=
ter the PID module was started, the pwm value oscillated between 12 and 153=
. I deleted other configurations and only kept one fan and one temp. I have=
 debugged various PID parameter values of fan,
 and there is no obvious change in the phenomenon. Please take a look at it=
, thank you.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<span style=3D"color:rgb(81,167,249)">=C2=A0</span><span style=3D"color:rgb=
(81,167,249)"> =C2=A0</span><span style=3D"color:rgb(81,167,249)">The confi=
guration is as follows</span><span style=3D"color:rgb(81,167,249)">:=C2=A0<=
/span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
=C2=A0 =C2=A04611 root =C2=A0 =C2=A0 =C2=A07616 S =C2=A0 =C2=A0/usr/bin/swa=
mpd -t -l /tmp/<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
=C2=A0 =C2=A0root@starlake-sn:~# cat /etc/thermal.d/setpoint</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
=C2=A0 =C2=A03000</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<span style=3D"color:rgb(81,167,249)">=C2=A0</span><span style=3D"color:rgb=
(81,167,249)"> =C2=A0config.json as follow:</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
=C2=A0 =C2=A0{
<div>=C2=A0 =C2=A0 &quot;sensors&quot; : [</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 {</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;name&quot;: &quot;Fan0=
_Speed&quot;,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;fan&=
quot;,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;readPath&quot;: &quot;=
/xyz/openbmc_project/sensors/fan_tach/Fan0_Speed&quot;, =C2=A0
</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;writePath&quot;: &quot=
;/xyz/openbmc_project/sensors/fan_tach/Fan0_Speed&quot;, =C2=A0</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;min&quot;: 0,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;max&quot;: 255,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;timeout&quot;: 0</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 },</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 {</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;name&quot;: &quot;inle=
t_Temp&quot;,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;temp=
&quot;,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;readPath&quot;: &quot;=
/xyz/openbmc_project/sensors/temperature/inlet_Temp&quot;,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;writePath&quot;: &quot=
;&quot;,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;min&quot;: 0,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;max&quot;: 0,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;ignoreDbusMinMax&quot;=
: true,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;timeout&quot;: 0</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }</div>
=C2=A0 =C2=A0 ],</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
=C2=A0 &quot;zones&quot; : [
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 {</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;id&quot;: 1,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;minThermalOutput&quot;=
: 3000.0,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;failsafePercent&quot;:=
 75.0,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pids&quot;: [</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
&quot;name&quot;: &quot;Fan0_Speed&quot;,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
&quot;type&quot;: &quot;fan&quot;,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
&quot;inputs&quot;: [&quot;Fan0_Speed&quot;],</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
&quot;setpoint&quot;: 50.0,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
&quot;pid&quot;: {</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;samplePeriod&quot;: 0.1,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;proportionalCoeff&quot;: 20.0,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;integralCoeff&quot;: 0.1, =C2=A0 =C2=A0 </div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;feedFwdOffsetCoeff&quot;: 0.0,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;feedFwdGainCoeff&quot;: 1.0, =C2=A0</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;integralLimit_min&quot;: 0.0, </div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;integralLimit_max&quot;: 5.0, </div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;outLim_min&quot;: 5.0, =C2=A0 =C2=A0 =C2=A0 =C2=A0</div=
>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;outLim_max&quot;: 60.0, =C2=A0 =C2=A0 =C2=A0 </div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;slewNeg&quot;: 0.0,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;slewPos&quot;: 0.0</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
}</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
&quot;name&quot;: &quot;inlet_Temp&quot;,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
&quot;type&quot;: &quot;temp&quot;,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
&quot;inputs&quot;: [&quot;inlet_Temp&quot;], =C2=A0 =C2=A0 </div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
&quot;setpoint&quot;: 50.0,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
&quot;pid&quot;: { =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0amplePeriod&quot;: 0.1, =C2=A0 =C2=A0 =C2=A0</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;samplePeriod&quot;: 1.0, =C2=A0 =C2=A0 =C2=A0</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;proportionalCoeff&quot;: -0.1,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;integralCoeff&quot;: 1.0, =C2=A0 =C2=A0 36;34Hin&quot;:=
 5.0,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;feedFwdOffsetCoeff&quot;: 0.0,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;feedFwdGainCoeff&quot;: 0.0, =C2=A0</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;integralLimit_min&quot;: 0.0, </div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;integralLimit_max&quot;: 0.0, </div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;outLim_min&quot;: 3000.0, =C2=A0 =C2=A0 </div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;outLim_max&quot;: 16000.0, =C2=A0 =C2=A0</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;slewNeg&quot;: 0.0,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;slewPos&quot;: 0.0,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;positiveHysteresis&quot;: 1.0,</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;negativeHysteresis&quot;: 1.0 </div>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }</div>
<div>=C2=A0 =C2=A0 ]</div>
}<br>
</div>
</div>
</div>
</div>

</blockquote></div></div>

--000000000000cb1cc905b3d644b3--
