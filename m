Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2810023D59E
	for <lists+openbmc@lfdr.de>; Thu,  6 Aug 2020 04:56:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMY6r5zyjzDqN5
	for <lists+openbmc@lfdr.de>; Thu,  6 Aug 2020 12:56:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d35;
 helo=mail-io1-xd35.google.com; envelope-from=ticotimo@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gGQPvUgR; dkim-atps=neutral
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMY5t5FLjzDqKf
 for <openbmc@lists.ozlabs.org>; Thu,  6 Aug 2020 12:56:02 +1000 (AEST)
Received: by mail-io1-xd35.google.com with SMTP id a5so32865620ioa.13
 for <openbmc@lists.ozlabs.org>; Wed, 05 Aug 2020 19:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tk2DdJZQpJRn9EIQzszkJeifS32SlwtH7tfKiuDH7vY=;
 b=gGQPvUgRZ0T44+3GA0/kABYWhih15eQ8a4CYMN9nkeRSI5iQQR5I0fx8TpoQDPTlwF
 GZVZnuQyGjbhYEnPNsuV8+YGsk/N1ru2YxgesRoyaiIqTVsOzo6Zg+FjwJ+jxiCpLhMF
 6hNa3Lg/3hxMNg+JUfRBDahZ5wYIMn1NDmrNTsOfoeoQdSUXTBFomBghpcd3OD344lo+
 HzbX564wPswfuHq9vuLs1rW6lNBsb7Zo62ALM1cQoBOnjdNd8kEygu2GYUr3TbeVTU70
 6Btxe9YLM4wV8aF+hvlYEwzu/ygfH88VIjRXG1s0pdiZkapim/PoI0JEWdrU2Qsx5eMQ
 iQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tk2DdJZQpJRn9EIQzszkJeifS32SlwtH7tfKiuDH7vY=;
 b=FbetsR9AVIAdq+DDr8wAauQ77VytAOvgdvaXwdmhUDVjMggvU1JCLoFl1b9Q8hXZPQ
 9wXYWiL8Ajc9Vsvmk03dDZEEPVPhJH64o8WJ8iJhhMMdOF0jq02IquFgtW8D281IR9ju
 mYjE5Lp2GsqPTMDoKN5l6n92n/kNs+F6d6Z6pxOSG8l7QNQuoeE6IC/RFWVvdPjgL2Pm
 p5sHGufe8+S3B0sRbn2hdEANA4XMam9I9z02Ahb3pmsx4LtX+zyDTLrUpOov9j5xNQEM
 fYbMk2KPjXysP3zZTgg+bzP8NyJRzjQEV42tfxUbvaHxB7foucbEYZYCfdTC1HB79DTi
 eiPQ==
X-Gm-Message-State: AOAM530wThPk9gX91NnrpEBmmy1ETfKxkzMJH/NV4wnxviX2kIJDQXax
 hAGnZpqV+gU6xPzfa7p50blv2gF6FJ+Xw0qFH9g=
X-Google-Smtp-Source: ABdhPJzEUZ+Hs7p5Y26czCtlBYZPyIDTX4g8VlQSw9ftr6uCbE70ehUX+N7CpUuW/q5oEliqI555ufwlTFFOP1914V0=
X-Received: by 2002:a5d:8b4f:: with SMTP id c15mr6838837iot.146.1596682558964; 
 Wed, 05 Aug 2020 19:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <CABbLDjM09zoW7xo0UdgJc=BsQ2ef7kVFbZFNVmdefc6RtHrz8Q@mail.gmail.com>
 <CANx9H-C3bOT=Nbn4RqxjpCcmTFij1=YqOp8fUy2td6sVU3J-AQ@mail.gmail.com>
In-Reply-To: <CANx9H-C3bOT=Nbn4RqxjpCcmTFij1=YqOp8fUy2td6sVU3J-AQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 5 Aug 2020 19:55:48 -0700
Message-ID: <CANx9H-BHNknmx4Px67jd_fLUV06-cDonFn9ZHX2jTXjZtMYbMw@mail.gmail.com>
Subject: Re: yoctoproject restructured?
To: Anony Mous <obmc.developers@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000bf097b05ac2ca099"
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000bf097b05ac2ca099
Content-Type: text/plain; charset="UTF-8"

The issue with the NAS infrastructure has been resolved. If you see any
lingering issues please let me know or post an email to
yocto@lists.openembedded.org or IRC on Freenode #yocto

On Tue, Aug 4, 2020 at 3:24 PM Tim Orling <ticotimo@gmail.com> wrote:

> We are experiencing infrastructure issues on the NAS that feeds dl.yp.o
>
> On Tue, Aug 4, 2020 at 2:28 PM Anony Mous <obmc.developers@gmail.com>
> wrote:
>
>> Hi:  I have been building without issues, but I just did a fresh git to
>> do a new build, and I am now failing because the system cannot fetch the
>> file http://downloads.yoctoproject.org/releases/opkg/opkg.0.4.2.tar.gz.
>>
>> Does anyone know of a workaround for this error.
>>
>> Thank you!
>>
>>

--000000000000bf097b05ac2ca099
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The issue with the NAS infrastructure has been resolved. I=
f you see any lingering issues please=C2=A0let me know or post an email to =
<a href=3D"mailto:yocto@lists.openembedded.org">yocto@lists.openembedded.or=
g</a> or IRC on Freenode #yocto</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Tue, Aug 4, 2020 at 3:24 PM Tim Orling &l=
t;<a href=3D"mailto:ticotimo@gmail.com">ticotimo@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,20=
4,204);padding-left:1ex"><div><div dir=3D"auto">We are experiencing infrast=
ructure issues on the NAS that feeds dl.yp.o</div></div><div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 4, 2020 =
at 2:28 PM Anony Mous &lt;<a href=3D"mailto:obmc.developers@gmail.com" targ=
et=3D"_blank">obmc.developers@gmail.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:=
1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left=
:1ex"><div dir=3D"ltr">Hi:=C2=A0 I have been building without issues, but I=
 just did a fresh git to do a new build, and I am now failing because the s=
ystem cannot=C2=A0fetch the file <a href=3D"http://downloads.yoctoproject.o=
rg/releases/opkg/opkg.0.4.2.tar.gz" target=3D"_blank">http://downloads.yoct=
oproject.org/releases/opkg/opkg.0.4.2.tar.gz</a>.<div><br></div><div>Does a=
nyone know of a workaround for this error.</div><div><br></div><div>Thank y=
ou!</div><div><br></div></div>
</blockquote></div></div>
</blockquote></div>

--000000000000bf097b05ac2ca099--
