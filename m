Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC34C553B0
	for <lists+openbmc@lfdr.de>; Tue, 25 Jun 2019 17:45:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Y9VQ4yt1zDqLZ
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 01:45:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FusRvxHj"; 
 dkim-atps=neutral
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Y93B4zHqzDqLg
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2019 01:25:41 +1000 (AEST)
Received: by mail-yb1-xb2e.google.com with SMTP id l10so4306624ybj.5
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jun 2019 08:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vjpUWfMu4ikka+xUzYGNiiSeTtHt8tv5Ud2mICr0ooU=;
 b=FusRvxHjDLX5duNCrqpKc9wLjwLf3cgdMG7P6+q6oyLJs/jZr1GSCa1pLOXJuwDoSs
 R9po/al9kcXpnIjjh/C/JFhg7O3tZwRVhhiwBzFk8xdok8kz4mGRSUZgZg3HGaohlkwo
 lbO4R2ozuUc4FyLh+X5XNCRSXUOk9pUq6Hv+xPFF2vNyqytdYn4AaBa2G0sWdcGzxWqB
 /9A0dIYOb8WwNqJWM3pquiS3DCzFoDPOEjpmnJxM8JzTQAdreRRSNEKIM5st4Bvl/rHc
 cepDCrTBm7IkrJR29JohyFlqeLZNvg9Gqdjp7uWcGkyfjCz6ARolE1QHQoms8CjumMN6
 LiWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vjpUWfMu4ikka+xUzYGNiiSeTtHt8tv5Ud2mICr0ooU=;
 b=Ylj+twanRQD7/xyhfU25XG92kob/78ZjM+FkgJxx6isOJ7wmurwsFyut26y6ir542l
 oCpO/rzorqWzkYJYvu7Ex65VpoKvKgQvwwsK7fkuJnLu2CLJSXjS2xbzE2fclgsTGsfQ
 70gmQ7gPOznWXUZuxQKfEosi/bKiwkMzcCvUHsSxxCuhh2+SEaQmUyto27Yw3yAeB9b/
 7DDTIsyFJgz1zq0yMVGNvRNPXVeHEYYfBYKjVcbioVOA5wwo7YO2iFYlGOw5gI3aS5PG
 wBQ5cHp7NN+dogAf4LJJsmaMpKy9UxHkKaYR5X7YRYRwYwS8W6P4GCimgY/cpa+7AuAL
 Vi3Q==
X-Gm-Message-State: APjAAAW+Csbs7TAP7Dknp21xOHo3ZKLN8GQE9k0TG5KHK+lWHA9tB+I4
 y3Xqe7djh2FkM4Lr+50bg3B8TF7SxIAmoJ6so+c=
X-Google-Smtp-Source: APXvYqxNcx+qIQdHmQhPaD6TGBFjUZ+zYBWQJVURYa19L2/WmPddBKT8vbS2FLC3EWFjxoSkJS50NZSzvARlHZvlH08=
X-Received: by 2002:a25:5056:: with SMTP id e83mr7764873ybb.9.1561476337487;
 Tue, 25 Jun 2019 08:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.3250.1560532343.4162.openbmc@lists.ozlabs.org>
 <tencent_69C7E9EC6F65C50D0F925BFF@qq.com>
 <CAOUmYFRYB3i_-sLBMbmOXJX3-Lo49QjfK2G01XFHbj4Mndx4sA@mail.gmail.com>
 <CAMTupoQ9fovzOcFH__Ljq=y8RKAp8_7WYunzQ8xNcc6Qjk+Dvg@mail.gmail.com>
 <tencent_799D81715559779D478D3D61@qq.com>
 <CAOUmYFTVYjXwXP_oC6+yMUaUS8d15=Ys5BDqGjc-N5JBQC8HQg@mail.gmail.com>
 <tencent_1BF1F4AC2B9970D9471A8668@qq.com>
 <CAMTupoTUFv3TCY=D8OatOTCeoBdCsbqXVep5ZM6vXdJ1EGgr-A@mail.gmail.com>
 <181ab467.6aa8.16b8d45bb45.Coremail.rxsun@zd-tech.com.cn>
In-Reply-To: <181ab467.6aa8.16b8d45bb45.Coremail.rxsun@zd-tech.com.cn>
From: Jandra A <jandraara@gmail.com>
Date: Tue, 25 Jun 2019 10:25:26 -0500
Message-ID: <CAMTupoT26K4x4RB+=DiEphFfKZWhBm-ysb17J+thmuxkTVJodQ@mail.gmail.com>
Subject: Re: Re: Re: Network Settings GUI
To: =?UTF-8?B?5a2Z55Ge6Zye?= <rxsun@zd-tech.com.cn>
Content-Type: multipart/alternative; boundary="0000000000006bd279058c278a93"
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
Cc: xiuzhi <1450335857@qq.com>, openbmc <openbmc@lists.ozlabs.org>,
 Derick <derick.montague@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000006bd279058c278a93
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Great, let's meet using my webex https://ibm.webex.com/meet/jandra.arangure=
n I
will send you an invite as well.

On Tue, Jun 25, 2019 at 1:16 AM =E5=AD=99=E7=91=9E=E9=9C=9E <rxsun@zd-tech.=
com.cn> wrote:

> Hi,all,
> I will be glad to meet at 7:00AM Central time this Wednesday (June 26th).
>
> Ruixia,Sun
>
>
>
> =E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9A"Jandra A" <jandraara@gmail.com>
> =E5=8F=91=E9=80=81=E6=97=A5=E6=9C=9F=EF=BC=9A2019-06-25 00:51:39
> =E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=9Axiuzhi <1450335857@qq.com>
> =E6=8A=84=E9=80=81=E4=BA=BA=EF=BC=9ADerick <derick.montague@gmail.com>,op=
enbmc <openbmc@lists.ozlabs.org>,rxsun
> <rxsun@zd-tech.com.cn>
> =E4=B8=BB=E9=A2=98=EF=BC=9ARe: Re: Network Settings GUI
>
> Hi Xiuzhi and Ruixia,
>
> It would be great to set some time to align on the requirements from
> design and how to work together so that your team can start on the so
> front-end development.
>
> Like Derick said, we meet every other Wednesday at 10:00 Central time to
> discuss GUI issues, with the next one being next Wednesday (July 3rd).
> Hopefully you can make that.
>
> If you cannot, I am happy to meet at 7:00 or 8:00 AM Central time this
> Wednesday (June 26th) or Friday (June 28th). Please let me know.
>
> Regards,
>
> On Wed, Jun 19, 2019 at 8:30 PM xiuzhi <1450335857@qq.com> wrote:
>
>> Hi Derick,
>> >> The IPV6 webui should support both IPV4 and IPV6 on a single interfac=
e
>> at the same time and users can set IPV4 and IPV6 on the same network
>> webpage from Lenovo test cases.
>>
>> >Thank you!
>>
>> >>  Ruixia (her email: rxsun@zd-tech.com.cn;), form my team can do
>> front-end  to implement your design .  It would be best if the IPV6 feat=
ure
>> could be achieved in one to two months.
>>
>> >It would be great if she were able to join our GUI Community
>> workgroup. It's every other Wednesday at 10:00 Central Time. We use
>> these to discuss all the GUI issues. Where are you located?
>>   I am in BeiJing  UTC+8. The meeting time is  Wednesday  23:00 Beijing
>> Time (Wednesday 10:00 am Central Daylight Time),isn't it?
>> >GUI Community Workgroup Wiki:
>> https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group
>>
>> Best,
>> Xiuzhi
>>
>

--0000000000006bd279058c278a93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Great, let&#39;s meet using my webex=C2=A0<a href=3D"https=
://ibm.webex.com/meet/jandra.aranguren" target=3D"_blank" style=3D"box-sizi=
ng:inherit;text-decoration-line:none;outline:0px;color:rgb(16,92,182);font-=
family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;font-size:12px=
">https://ibm.webex.com/meet/jandra.aranguren</a>=C2=A0I will send you an i=
nvite as well.=C2=A0</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Tue, Jun 25, 2019 at 1:16 AM =E5=AD=99=E7=91=9E=E9=
=9C=9E &lt;<a href=3D"mailto:rxsun@zd-tech.com.cn">rxsun@zd-tech.com.cn</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 style=3D"line-height:1.7;color:rgb(0,0,0);font-size:14px;font-family:Arial=
"><div>Hi,all,</div><div>I will be glad to meet at 7:00AM Central time this=
 Wednesday (June 26th).</div><div><br></div><div>Ruixia,Sun</div><br><br><d=
iv style=3D"zoom:1"></div><br>=E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9A&quot;Jan=
dra A&quot; &lt;<a href=3D"mailto:jandraara@gmail.com" target=3D"_blank">ja=
ndraara@gmail.com</a>&gt;<br>=E5=8F=91=E9=80=81=E6=97=A5=E6=9C=9F=EF=BC=9A2=
019-06-25 00:51:39<br>=E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=9Axiuzhi &lt;<a hre=
f=3D"mailto:1450335857@qq.com" target=3D"_blank">1450335857@qq.com</a>&gt;<=
br>=E6=8A=84=E9=80=81=E4=BA=BA=EF=BC=9ADerick &lt;<a href=3D"mailto:derick.=
montague@gmail.com" target=3D"_blank">derick.montague@gmail.com</a>&gt;,ope=
nbmc &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">open=
bmc@lists.ozlabs.org</a>&gt;,rxsun &lt;<a href=3D"mailto:rxsun@zd-tech.com.=
cn" target=3D"_blank">rxsun@zd-tech.com.cn</a>&gt;<br>=E4=B8=BB=E9=A2=98=EF=
=BC=9ARe: Re: Network Settings GUI<br><blockquote id=3D"gmail-m_-8231268627=
540647716isReplyContent" style=3D"padding-left:1ex;margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204)"><div dir=3D"ltr">Hi=C2=A0Xiuzhi an=
d Ruixia,=C2=A0<div><br></div><div>It would be great to set some time to al=
ign on the requirements from design and how to work together so that your t=
eam can start on the so front-end development.=C2=A0=C2=A0<br><br>Like Deri=
ck said, we meet every other Wednesday at 10:00 Central time to discuss GUI=
 issues, with the next one being next Wednesday (July 3rd). Hopefully you c=
an make that.=C2=A0</div><div><br></div><div>If you cannot, I am happy to m=
eet at 7:00 or 8:00 AM Central time this Wednesday (June 26th) or Friday (J=
une 28th). Please let me know.=C2=A0</div><div><br></div><div>Regards,</div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Wed, Jun 19, 2019 at 8:30 PM xiuzhi &lt;<a href=3D"mailto:1450335857@qq=
.com" target=3D"_blank">1450335857@qq.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div>Hi Derick,</div><div>&gt;&gt;=
 The IPV6 webui should support both IPV4 and IPV6 on a single interface at =
the same time and users can set IPV4 and IPV6 on the same network webpage f=
rom Lenovo test cases.</div><div><br>&gt;Thank you!<br><br>&gt;&gt;=C2=A0 R=
uixia (her email: <a href=3D"mailto:rxsun@zd-tech.com.cn" target=3D"_blank"=
>rxsun@zd-tech.com.cn</a>;), form my team can do=C2=A0 front-end=C2=A0 to i=
mplement your design .=C2=A0 It would be best if the IPV6 feature could be =
achieved in one to two months.<br><br>&gt;It would be great if she were abl=
e to join our GUI Community<br>workgroup. It&#39;s every other Wednesday at=
 10:00 Central Time. We use<br>these to discuss all the GUI issues. Where a=
re you located?<br>=C2=A0 I am in BeiJing=C2=A0 UTC+8. The meeting time is=
=C2=A0=C2=A0Wednesday=C2=A0 23:00 Beijing Time (Wednesday 10:00 am=C2=A0<sp=
an style=3D"font-family:Arial,Helvetica,sans-serif;font-size:17px">Central =
Daylight Time</span>),isn&#39;t it?</div><div>&gt;GUI Community Workgroup W=
iki:<br><a href=3D"https://github.com/openbmc/openbmc/wiki/GUI-Design-work-=
group" target=3D"_blank">https://github.com/openbmc/openbmc/wiki/GUI-Design=
-work-group</a><br></div><div><br></div><div>Best,</div><div>Xiuzhi</div></=
blockquote></div>
</blockquote></div></blockquote></div>

--0000000000006bd279058c278a93--
