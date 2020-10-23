Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB79229683C
	for <lists+openbmc@lfdr.de>; Fri, 23 Oct 2020 03:02:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHQtr11SwzDqyl
	for <lists+openbmc@lfdr.de>; Fri, 23 Oct 2020 12:02:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::135;
 helo=mail-il1-x135.google.com; envelope-from=yuenn@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=OaD2RO94; dkim-atps=neutral
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHQsm4bYTzDr1D
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2020 12:01:32 +1100 (AEDT)
Received: by mail-il1-x135.google.com with SMTP id w17so3457638ilg.8
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2020 18:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=lF6TCmkSu6+SN2WK6y2QHepkXQdwr+jY0ZkDboSC/+E=;
 b=OaD2RO94R3nUMBMRLJZLP30XCm6Z/qgXCB60gOpkjSBXPuO2Uov+kh431bi/3VCsPZ
 +c+hJYcT3530azOFi2incjKunnNPbCGDpUUi8CysRXr5qrVeXEpCvrgZfRvCmOmbwSh5
 uPEFqWmR/qAeyvYhqUxx77CGZo/s7sHH5Cp9qbq662YgL42ParpE5Ui4xllNrxKyV18r
 6PX63lWxvBP5R47HnRfsVp+FSAuqSxVB8qoEsvd9lt1kQvfnHQELCR7C15RQwkg7LbV/
 GMnIvpGl90tmPr1v+63HN4JWuH+au598AYGGElGgh028pG3MK4Vs3lv3MxjCU6fYhj/n
 ijhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=lF6TCmkSu6+SN2WK6y2QHepkXQdwr+jY0ZkDboSC/+E=;
 b=ARN2LGMgivLvSWuZvlxxxJkD+OliBkButAJNlnk6+fSlPvhR+32pfpP7LvXyOUnmUk
 fTvszpjX4fB3tceoe9AduBuoYHmLfRTHxPAGUnQN00dlTZJFq3N92rzrApJ0MvzGnwma
 cmC5UPa4BOi5S28wbfpENtkN2qcTkJTQiszVTlhfeJ8CcLAc9Snf+no6PX+2n13rF4YF
 bEwuO8BOm4FKPFXV7XbBPA9haGqAk6VI5SWZOi6LUQoApCvTvTaixWWoXCUxlZOsEPsb
 Kqlw/ymZAtywEQrXA17vTGhGV1yggl6WpHD5SU5Ku34kkrFz5aIh+xHwGIIUZCiFhWRC
 eXzw==
X-Gm-Message-State: AOAM533C7GMiu6czjrr8Ypacz+dnb5nK7lwnV1Cb2o03ez+XeIQQ4PdE
 8UnE1+NOU3jFhd1teNfs6JvBXTuRa390VocFl6oBWdsU5ioCbYCr
X-Google-Smtp-Source: ABdhPJyAd+2Hi/k13Yvyh4fRvy3x1AxOY3BB75o6/op+bA/R4iNXB5leyyhcqRQJjPnztnUlXcKilFUbyiqhBwGkkkY=
X-Received: by 2002:a92:480e:: with SMTP id v14mr3490122ila.218.1603414886384; 
 Thu, 22 Oct 2020 18:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <CADfYTpGw9G0ACwhmiZU_v8HoT4nZy8a3wnCGbozM1QiNFaX9og@mail.gmail.com>
In-Reply-To: <CADfYTpGw9G0ACwhmiZU_v8HoT4nZy8a3wnCGbozM1QiNFaX9og@mail.gmail.com>
From: Nancy Yuen <yuenn@google.com>
Date: Thu, 22 Oct 2020 18:00:49 -0700
Message-ID: <CADfYTpGQo=N1QV-EgiZ3io6fmv84M4A8gs0oUY2+9_0qVmrM6Q@mail.gmail.com>
Subject: Re: thoughts on livepatch?
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000bbac1505b24c1ef9"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000bbac1505b24c1ef9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

And I was trigger happy.  Meant to include
https://www.kernel.org/doc/Documentation/livepatch/livepatch.txt

On Thu, Oct 22, 2020 at 5:59 PM Nancy Yuen <yuenn@google.com> wrote:

> Anyone tried it with OpenBMC?  Any thoughts?
>
> Nancy Yuen
>
> =E2=80=A2
>
> Google Platforms
>
> =E2=80=A2
>
> yuenn@google.com
>
> =E2=80=A2
>
> Google LLC
>


--=20

Nancy Yuen

=E2=80=A2

Google Platforms

=E2=80=A2

yuenn@google.com

=E2=80=A2

Google LLC

--000000000000bbac1505b24c1ef9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">And I was trigger happy.=C2=A0 Meant to i=
nclude=C2=A0<a href=3D"https://www.kernel.org/doc/Documentation/livepatch/l=
ivepatch.txt">https://www.kernel.org/doc/Documentation/livepatch/livepatch.=
txt</a></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, Oct 22, 2020 at 5:59 PM Nancy Yuen &lt;<a href=3D"mailto:yue=
nn@google.com">yuenn@google.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr">Anyone tried it with Open=
BMC?=C2=A0 Any thoughts?<br clear=3D"all"><div><br></div><div dir=3D"ltr"><=
div dir=3D"ltr"><span><div dir=3D"ltr" style=3D"margin-left:0pt" align=3D"l=
eft"><table style=3D"border:none;border-collapse:collapse"><colgroup><col w=
idth=3D"73"><col width=3D"7"><col width=3D"111"><col width=3D"7"><col width=
=3D"122"><col width=3D"7"><col width=3D"71"></colgroup><tbody><tr style=3D"=
height:15pt"><td style=3D"border-top:1.5pt solid rgb(213,15,37);vertical-al=
ign:middle;overflow:hidden"><p dir=3D"ltr" style=3D"line-height:1.38;text-a=
lign:center;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt=
;font-family:Roboto,sans-serif;color:rgb(102,102,102);background-color:tran=
sparent;font-weight:700;vertical-align:baseline;white-space:pre-wrap">Nancy=
 Yuen</span></p></td><td style=3D"border-top:1.5pt solid rgb(102,102,102);v=
ertical-align:middle;overflow:hidden"><p dir=3D"ltr" style=3D"line-height:1=
.38;text-align:center;margin-top:0pt;margin-bottom:0pt"><span style=3D"font=
-size:11pt;font-family:Arial;color:rgb(255,0,0);background-color:transparen=
t;font-weight:700;vertical-align:baseline;white-space:pre-wrap">=E2=80=A2</=
span></p></td><td style=3D"border-top:1.5pt solid rgb(51,105,232);vertical-=
align:middle;overflow:hidden"><p dir=3D"ltr" style=3D"line-height:1.38;text=
-align:center;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10=
pt;font-family:Roboto,sans-serif;color:rgb(102,102,102);background-color:tr=
ansparent;font-weight:700;vertical-align:baseline;white-space:pre-wrap">Goo=
gle Platforms=C2=A0</span></p></td><td style=3D"border-top:1.5pt solid rgb(=
102,102,102);vertical-align:middle;overflow:hidden"><p dir=3D"ltr" style=3D=
"line-height:1.38;text-align:center;margin-top:0pt;margin-bottom:0pt"><span=
 style=3D"font-size:11pt;font-family:Arial;color:rgb(61,133,198);background=
-color:transparent;font-weight:700;vertical-align:baseline;white-space:pre-=
wrap">=E2=80=A2</span></p></td><td style=3D"border-top:1.5pt solid rgb(0,15=
3,57);vertical-align:middle;overflow:hidden"><p dir=3D"ltr" style=3D"line-h=
eight:1.38;text-align:center;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:10pt;font-family:Roboto,sans-serif;color:rgb(102,102,102);bac=
kground-color:transparent;font-weight:700;vertical-align:baseline;white-spa=
ce:pre-wrap"><a href=3D"mailto:yuenn@google.com" target=3D"_blank">yuenn@go=
ogle.com</a></span></p></td><td style=3D"border-top:1.5pt solid rgb(102,102=
,102);vertical-align:middle;overflow:hidden"><p dir=3D"ltr" style=3D"line-h=
eight:1.38;text-align:center;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial;color:rgb(0,153,57);background-color:t=
ransparent;font-weight:700;vertical-align:baseline;white-space:pre-wrap">=
=E2=80=A2</span></p></td><td style=3D"border-top:1.5pt solid rgb(238,178,17=
);vertical-align:middle;overflow:hidden"><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;text-align:center;margin-top:0pt;margin-bottom:0pt"><span style=3D"f=
ont-size:10pt;font-family:Roboto,sans-serif;color:rgb(102,102,102);backgrou=
nd-color:transparent;font-weight:700;vertical-align:baseline;white-space:pr=
e-wrap">Google LLC</span></p></td></tr></tbody></table></div></span></div><=
/div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><span><div dir=3D"ltr" style=3D=
"margin-left:0pt" align=3D"left"><table style=3D"border:none;border-collaps=
e:collapse"><colgroup><col width=3D"73"><col width=3D"7"><col width=3D"111"=
><col width=3D"7"><col width=3D"122"><col width=3D"7"><col width=3D"71"></c=
olgroup><tbody><tr style=3D"height:15pt"><td style=3D"border-top:1.5pt soli=
d rgb(213,15,37);vertical-align:middle;overflow:hidden"><p dir=3D"ltr" styl=
e=3D"line-height:1.38;text-align:center;margin-top:0pt;margin-bottom:0pt"><=
span style=3D"font-size:10pt;font-family:Roboto,sans-serif;color:rgb(102,10=
2,102);background-color:transparent;font-weight:700;vertical-align:baseline=
;white-space:pre-wrap">Nancy Yuen</span></p></td><td style=3D"border-top:1.=
5pt solid rgb(102,102,102);vertical-align:middle;overflow:hidden"><p dir=3D=
"ltr" style=3D"line-height:1.38;text-align:center;margin-top:0pt;margin-bot=
tom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(255,0,0)=
;background-color:transparent;font-weight:700;vertical-align:baseline;white=
-space:pre-wrap">=E2=80=A2</span></p></td><td style=3D"border-top:1.5pt sol=
id rgb(51,105,232);vertical-align:middle;overflow:hidden"><p dir=3D"ltr" st=
yle=3D"line-height:1.38;text-align:center;margin-top:0pt;margin-bottom:0pt"=
><span style=3D"font-size:10pt;font-family:Roboto,sans-serif;color:rgb(102,=
102,102);background-color:transparent;font-weight:700;vertical-align:baseli=
ne;white-space:pre-wrap">Google Platforms=C2=A0</span></p></td><td style=3D=
"border-top:1.5pt solid rgb(102,102,102);vertical-align:middle;overflow:hid=
den"><p dir=3D"ltr" style=3D"line-height:1.38;text-align:center;margin-top:=
0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;colo=
r:rgb(61,133,198);background-color:transparent;font-weight:700;vertical-ali=
gn:baseline;white-space:pre-wrap">=E2=80=A2</span></p></td><td style=3D"bor=
der-top:1.5pt solid rgb(0,153,57);vertical-align:middle;overflow:hidden"><p=
 dir=3D"ltr" style=3D"line-height:1.38;text-align:center;margin-top:0pt;mar=
gin-bottom:0pt"><span style=3D"font-size:10pt;font-family:Roboto,sans-serif=
;color:rgb(102,102,102);background-color:transparent;font-weight:700;vertic=
al-align:baseline;white-space:pre-wrap"><a href=3D"mailto:yuenn@google.com"=
 target=3D"_blank">yuenn@google.com</a></span></p></td><td style=3D"border-=
top:1.5pt solid rgb(102,102,102);vertical-align:middle;overflow:hidden"><p =
dir=3D"ltr" style=3D"line-height:1.38;text-align:center;margin-top:0pt;marg=
in-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,=
153,57);background-color:transparent;font-weight:700;vertical-align:baselin=
e;white-space:pre-wrap">=E2=80=A2</span></p></td><td style=3D"border-top:1.=
5pt solid rgb(238,178,17);vertical-align:middle;overflow:hidden"><p dir=3D"=
ltr" style=3D"line-height:1.38;text-align:center;margin-top:0pt;margin-bott=
om:0pt"><span style=3D"font-size:10pt;font-family:Roboto,sans-serif;color:r=
gb(102,102,102);background-color:transparent;font-weight:700;vertical-align=
:baseline;white-space:pre-wrap">Google LLC</span></p></td></tr></tbody></ta=
ble></div></span></div></div></div>

--000000000000bbac1505b24c1ef9--
