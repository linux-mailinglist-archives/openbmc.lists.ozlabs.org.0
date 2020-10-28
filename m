Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7E129CD7A
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 03:03:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLX1M235VzDqNw
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 13:03:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b29;
 helo=mail-yb1-xb29.google.com; envelope-from=james.mihm@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uf2GZ7GS; dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLX0T10cgzDqLl
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2020 13:02:58 +1100 (AEDT)
Received: by mail-yb1-xb29.google.com with SMTP id c129so2951563yba.8
 for <openbmc@lists.ozlabs.org>; Tue, 27 Oct 2020 19:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bYNGxdQGpQ/GcCcRCdBR2Q8cD+hPi35XzkhvfLRvYnk=;
 b=uf2GZ7GSRi0K4dgoqsRRN8+dGursWLuXwzlkGJYx25CDZSja0E/gsM2/jjVYVZGtjD
 NUTzCZ519q6v12SYjMzCtzgQlT3sClZf/LptYefik57ojjlixBAv0n46OXKSYVEmWx8y
 4virXDsRCBD65ISH1QtY6NEnB5jCXdhE/97MgpAYIMfurSWV7TBCUIQGYQIAPbZNNqnJ
 Kp1rGBfeZLBOuIrU+FciMlto2j3evh7bBcdWbbQD8TSnTUmabX6MZpl527Q2d/GZkwFg
 Pe6u/rg9Qhb6D6BnU/iCl+1p2LqpPuEiis27zlV7ZTd447TZgETvh3DP+alTFR800ZV/
 9Zaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bYNGxdQGpQ/GcCcRCdBR2Q8cD+hPi35XzkhvfLRvYnk=;
 b=MOFCe7qX9ebx+SA6nlMMXtHd2jJkG9vTAafGr6nEcg0e6vVUjJr3N8JZma3gGWn6jl
 8+8/+FtgVY6NlXHNrwReFF4BXE+8BjO+F7ZD7xmtW11j1iK1OpeakDkD9HPZHMQn8p4L
 2L47CijE+tTiPej/XLlPZZ0Awy6xg+76fnrv2P8GCA2dUKOQ090qFvO90okoJrjXd++g
 t74xyiPVIjVnB2CIOjLI9TtcYm4BL3yxSkZgBnBPW7GpUNoyU9XLa2emwGCuuc2euGqA
 kyqjltc2/j9H6EBG7IQlZecL1Ggs7VKmsy9WYpShmTn9TkZSOy/n/Z3ZMW4KSVulSGfA
 eyJw==
X-Gm-Message-State: AOAM5301BcgMpZmuV0jABpCPEeGjR/dr2e/ZnCglkVrFAmC6wGcRBvor
 t6xqPBXp3Rq5G1k3IBg2kGDMEBfUbOn4ZZWubwM=
X-Google-Smtp-Source: ABdhPJy+vwITsWLOed3UbtYWGdmgpkci6Kl+LDVObCZmc4gSPd1INnru3Ytku2Ca3ErHkxxPERMAdm1n9kz0U6gaH5Y=
X-Received: by 2002:a25:c6d0:: with SMTP id k199mr7750438ybf.469.1603850572083; 
 Tue, 27 Oct 2020 19:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <8da567c0-b5a4-47c0-90d6-d2de96ae99e5.moyan.yyb@alibaba-inc.com>
In-Reply-To: <8da567c0-b5a4-47c0-90d6-d2de96ae99e5.moyan.yyb@alibaba-inc.com>
From: James Mihm <james.mihm@gmail.com>
Date: Tue, 27 Oct 2020 19:02:15 -0700
Message-ID: <CADy_Pt3ukjs64bRkuEBB699cuvNadzatsBmQ_prSWWTokB0uhQ@mail.gmail.com>
Subject: Re: I just want to join the openbmc developer community
To: =?UTF-8?B?5p2o5YuH5YW1KOacq+WyqSk=?= <moyan.yyb@alibaba-inc.com>
Content-Type: multipart/alternative; boundary="0000000000009f34f605b2b18f1a"
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
Cc: =?UTF-8?B?5bi455CzKOeJueedvyk=?= <terui.cl@alibaba-inc.com>,
 openbmc <openbmc@lists.ozlabs.org>,
 =?UTF-8?B?5p2O576/KOS5ieWkqSk=?= <yitian.ly@alibaba-inc.com>,
 =?UTF-8?B?5p2O5b+X5YW1KOi+ueiNkik=?= <zhibing.lzb@alibaba-inc.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000009f34f605b2b18f1a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

V2VsY29tZSBNb3lhbiwNCg0KSWYgeW91IHBsYW4gdG8gY29udHJpYnV0ZSBjb2RlLCBwbGVhc2Ug
ZG93bmxvYWQgYW5kIGNvbXBsZXRlIHRoZSBDQ0xBIGF0DQpodHRwczovL2dpdGh1Yi5jb20vb3Bl
bmJtYy9vcGVuYm1jL2ZpbGVzLzE4NjA3NDEvT3BlbkJNQy5DQ0xBLnBkZiwgYW5kIG1haWwNCnRv
IHRoaXMgbWFpbGluZyBsaXN0Lg0KVGhlbiB0aG9zZSBkZXZlbG9wZXJzIGxpc3RlZCBpbiB0aGUg
Q0xBIHdpbGwgYmUgYWJsZSB0byBzdWJtaXQgY29kZQ0KY2hhbmdlcy4gU2VlIGh0dHBzOi8vZ2l0
aHViLmNvbS9vcGVuYm1jL2RvY3MvYmxvYi9tYXN0ZXIvQ09OVFJJQlVUSU5HLm1kDQpmb3IgbW9y
ZSBpbmZvcm1hdGlvbi4NCg0KVGhlcmUgYXJlIHNldmVyYWwgd29ya2dyb3VwcyBmb3IgdGhlIHBy
b2plY3QgdGhhdCB5b3UgY2FuIHBhcnRpY2lwYXRlIHdpdGguDQpTZWUgaHR0cHM6Ly9naXRodWIu
Y29tL29wZW5ibWMvb3BlbmJtYy93aWtpIGZvciBtb3JlIGluZm9ybWF0aW9uLg0KDQpKYW1lcy4N
Cg0KDQpPbiBUdWUsIE9jdCAyNywgMjAyMCBhdCA2OjMxIFBNIOadqOWLh+WFtSjmnKvlsqkpIDxt
b3lhbi55eWJAYWxpYmFiYS1pbmMuY29tPiB3cm90ZToNCg0KPiBIae+8jA0KPg0KPiAgICAgbXkg
bmFtZSBpcyBtb3lhbix3aG8gaXMgIHdvcmtpbmlnIGZvciBhbGliYWJhIGNvbXBhbnkuICBNeSBj
b21wYXkganVzdA0KPiB3YW50IHRvIGpvaW4gdGhlIG9wZW5ibWMgZGV2ZWxvcGVyIGNvbW11bml0
eSwgYW5kIGkgaGF2ZSBzdWJzY3JpYmVkIHRvDQo+IG9wZW5ibWMgYnkgYWNjZXNzaW5nIHRoZSB3
ZWJzaXRlIG9mICAiDQo+IGh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9saXN0aW5mby9vcGVuYm1j
Ii4gU28sIHdoYXQgc2hvdWxkIGkgZG8gbmV4dD8NCj4NCj4gVGhhbmsgeW91Lg0KPg0KPg0KPg0K
PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IOadqOWLh+WFte+8iOacq+Wyqe+8iQ0K
PiDln7rnoYDmnrbmnoTkuovkuJrnvqQt6K6h566X5LiO5a2Y5YKo5LqL5Lia6YOoLeacjeWKoeWZ
qOS6p+WTgQ0KPiDpgq7nrrHvvJptb3lhbi55eWJAYWxpYmFiYS1pbmMuY29tDQo+IE1vYmlsOjE4
Mi02NzE3LTk1NDYNCj4g5Yqe5YWs5Zyw54K577ya5rWZ5rGfLeadreW3ni3kvZnmna0tRUZD6Iux
5Zu95Lit5b+DMzTmpbwNCj4NCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPg0KPiDm
nKzpgq7ku7blj4rlhbbpmYTku7blkKvmnInpmL/ph4zlt7Tlt7Tpm4blm6LnmoTllYbkuJrnp5jl
r4bkv6Hmga/vvIzku4XpmZDkuo7lj5HpgIHnu5nkuIrpnaLlnLDlnYDkuK3liJflh7rnmoTkuKrk
urrlkoznvqTnu4TvvIznpoHmraLku7vkvZXlhbbku5bkurrku6Xku7vkvZXlvaLlvI/kvb/nlKjv
vIjljIXmi6zkvYbkuI3pmZDkuo7lhajpg6jmiJbpg6jliIblnLDms4TpnLLjgIHlpI3liLbmiJbm
laPlj5HvvInmnKzpgq7ku7blj4rlhbbpmYTku7bkuK3nmoTkv6Hmga/vvIzlpoLmnpzmgqjplJnm
lLbmnKzpgq7ku7bvvIzor7fmgqjnq4vljbPnlLXor53miJbpgq7ku7bpgJrnn6Xlj5Hku7bkurrl
ubbliKDpmaTmnKzpgq7ku7bjgIINCj4NCj4gVGhpcyBlbWFpbCBhbmQgaXRzIGF0dGFjaG1lbnRz
IGNvbnRhaW4gY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIGZyb20gQWxpYmFiYSBHcm91cCwgd2hp
Y2ggaXMgaW50ZW5kZWQgb25seSBmb3IgdGhlIHBlcnNvbiBvciBlbnRpdHkgd2hvc2UgYWRkcmVz
cyBpcyBsaXN0ZWQgYWJvdmUuIEFueSB1c2Ugb2YgaW5mb3JtYXRpb24gY29udGFpbmVkIGhlcmVp
biBpbiBhbnkgd2F5IChpbmNsdWRpbmcsIGJ1dCBub3QgbGltaXRlZCB0bywgdG90YWwgb3IgcGFy
dGlhbCBkaXNjbG9zdXJlLCByZXByb2R1Y3Rpb24gb3IgZGlzc2VtaW5hdGlvbikgYnkgcGVyc29u
cyBvdGhlciB0aGFuIHRoZSBpbnRlbmRlZCByZWNpcGllbnQocykgaXMgcHJvaGliaXRlZC4gSWYg
eW91IHJlY2VpdmUgdGhpcyBlbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVy
IGJ5IHBob25lIG9yIGVtYWlsIGltbWVkaWF0ZWx5IGFuZCBkZWxldGUgaXQuDQo+DQo+DQo+DQo=
--0000000000009f34f605b2b18f1a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Welcome Moyan,=C2=A0</div><div><br></div><div dir=3D"=
auto">If you plan to contribute code, please download and complete the CCLA=
 at <a href=3D"https://github.com/openbmc/openbmc/files/1860741/OpenBMC.CCL=
A.pdf">https://github.com/openbmc/openbmc/files/1860741/OpenBMC.CCLA.pdf</a=
>, and mail to this mailing list.</div><div>Then those developers listed in=
 the CLA will be able to submit code changes. See=C2=A0<a href=3D"https://g=
ithub.com/openbmc/docs/blob/master/CONTRIBUTING.md">https://github.com/open=
bmc/docs/blob/master/CONTRIBUTING.md</a> for more information.</div><div><b=
r></div><div>There are several workgroups for the project that you can part=
icipate with. See <a href=3D"https://github.com/openbmc/openbmc/wiki">https=
://github.com/openbmc/openbmc/wiki</a> for more information.</div><div><br>=
</div><div>James.=C2=A0</div><div dir=3D"auto"><br></div></div><div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 2=
7, 2020 at 6:31 PM =E6=9D=A8=E5=8B=87=E5=85=B5(=E6=9C=AB=E5=B2=A9) &lt;<a h=
ref=3D"mailto:moyan.yyb@alibaba-inc.com" target=3D"_blank">moyan.yyb@alibab=
a-inc.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div><div style=3D"line-height:1.7;font-family:Tahoma,Arial,STHe=
iti,SimSun;font-size:14px;color:rgb(0,0,0)"><div style=3D"clear:both;font-f=
amily:Tahoma,Arial,STHeiti,SimSun">Hi=EF=BC=8C</div><div style=3D"clear:bot=
h;font-family:Tahoma,Arial,STHeiti,SimSun">=C2=A0=C2=A0=C2=A0=C2=A0</div><d=
iv style=3D"clear:both;font-family:Tahoma,Arial,STHeiti,SimSun">=C2=A0=C2=
=A0=C2=A0=C2=A0my name is moyan,who is=C2=A0 workinig for alibaba company.=
=C2=A0 My compay just want to join the openbmc developer community, and=C2=
=A0<span style=3D"font-family:Tahoma,Arial,STHeiti,SimSun;font-size:14px;fo=
nt-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font=
-weight:400;text-align:start;text-indent:0px;text-transform:none;float:none=
;display:inline;background-color:rgb(255,255,255);color:rgb(0,0,0)">i have =
subscribed to openbmc by accessing the website of=C2=A0 &quot;</span><a hre=
f=3D"https://lists.ozlabs.org/listinfo/openbmc" style=3D"font-family:Tahoma=
,Arial,STHeiti,SimSun;font-size:14px;font-style:normal;font-variant-ligatur=
es:normal;font-variant-caps:normal;font-weight:400;text-align:start;text-in=
dent:0px;text-transform:none;background-color:rgb(255,255,255)" target=3D"_=
blank">https://lists.ozlabs.org/listinfo/openbmc</a><span style=3D"font-fam=
ily:Tahoma,Arial,STHeiti,SimSun;font-size:14px;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;text-align:sta=
rt;text-indent:0px;text-transform:none;float:none;display:inline;background=
-color:rgb(255,255,255);color:rgb(0,0,0)">&quot;.<span style=3D"font-family=
:Tahoma,Arial,STHeiti,SimSun">=C2=A0</span></span>So, what should i do next=
?<br></div><div style=3D"clear:both;font-family:Tahoma,Arial,STHeiti,SimSun=
"><br></div><div style=3D"clear:both;font-family:Tahoma,Arial,STHeiti,SimSu=
n">Thank you.</div><div style=3D"clear:both;font-family:Tahoma,Arial,STHeit=
i,SimSun"><br></div><div style=3D"clear:both;font-family:Tahoma,Arial,STHei=
ti,SimSun"><br></div><div style=3D"clear:both;font-family:Tahoma,Arial,STHe=
iti,SimSun"><span style=3D"font-style:normal;font-variant-ligatures:normal;=
font-variant-caps:normal;font-weight:400;text-align:left;text-indent:0px;te=
xt-transform:none;font-size:13px;font-family:simsun,STSongti-SC-Regular;col=
or:rgb(0,0,0)">------------------------------------------------------------=
-------------------------</span></div><div style=3D"clear:both;font-family:=
Tahoma,Arial,STHeiti,SimSun"><span style=3D"font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;text-align:left;t=
ext-indent:0px;text-transform:none;font-size:13px;font-family:simsun,STSong=
ti-SC-Regular;color:rgb(0,0,0)">=E6=9D=A8=E5=8B=87=E5=85=B5=EF=BC=88=E6=9C=
=AB=E5=B2=A9=EF=BC=89=C2=A0</span></div><div style=3D"clear:both;font-famil=
y:Tahoma,Arial,STHeiti,SimSun"><span style=3D"font-style:normal;font-varian=
t-ligatures:normal;font-variant-caps:normal;font-weight:400;text-align:left=
;text-indent:0px;text-transform:none;font-size:13px;font-family:simsun,STSo=
ngti-SC-Regular;color:rgb(0,0,0)">=E5=9F=BA=E7=A1=80=E6=9E=B6=E6=9E=84=E4=
=BA=8B=E4=B8=9A=E7=BE=A4-=E8=AE=A1=E7=AE=97=E4=B8=8E=E5=AD=98=E5=82=A8=E4=
=BA=8B=E4=B8=9A=E9=83=A8-=E6=9C=8D=E5=8A=A1=E5=99=A8=E4=BA=A7=E5=93=81</spa=
n></div><div style=3D"clear:both;font-family:Tahoma,Arial,STHeiti,SimSun"><=
span style=3D"font-style:normal;font-variant-ligatures:normal;font-variant-=
caps:normal;font-weight:400;text-align:left;text-indent:0px;text-transform:=
none;font-size:13px;font-family:simsun,STSongti-SC-Regular;color:rgb(0,0,0)=
">=E9=82=AE=E7=AE=B1=EF=BC=9A<a href=3D"mailto:moyan.yyb@alibaba-inc.com" s=
tyle=3D"font-family:simsun,STSongti-SC-Regular" target=3D"_blank">moyan.yyb=
@alibaba-inc.com</a>=C2=A0</span></div><div style=3D"clear:both;font-family=
:Tahoma,Arial,STHeiti,SimSun"><span style=3D"font-style:normal;font-variant=
-ligatures:normal;font-variant-caps:normal;font-weight:400;text-align:left;=
text-indent:0px;text-transform:none;font-size:13px;font-family:simsun,STSon=
gti-SC-Regular;color:rgb(0,0,0)">Mobil:182-6717-9546</span></div><div style=
=3D"clear:both;font-family:Tahoma,Arial,STHeiti,SimSun"><span style=3D"font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;text-align:left;text-indent:0px;text-transform:none;font-size:13p=
x;font-family:simsun,STSongti-SC-Regular;color:rgb(0,0,0)">=E5=8A=9E=E5=85=
=AC=E5=9C=B0=E7=82=B9=EF=BC=9A=E6=B5=99=E6=B1=9F-=E6=9D=AD=E5=B7=9E-=E4=BD=
=99=E6=9D=AD-EFC=E8=8B=B1=E5=9B=BD=E4=B8=AD=E5=BF=8334=E6=A5=BC</span></div=
><div style=3D"clear:both;font-family:Tahoma,Arial,STHeiti,SimSun"><span st=
yle=3D"font-style:normal;font-variant-ligatures:normal;font-variant-caps:no=
rmal;font-weight:400;text-align:left;text-indent:0px;text-transform:none;fo=
nt-size:13px;font-family:simsun,STSongti-SC-Regular;color:rgb(0,0,0)">-----=
---------------------------------------------------------------------------=
-----</span></div><div style=3D"clear:both;font-family:Tahoma,Arial,STHeiti=
,SimSun"><div style=3D"font-family:Tahoma,Arial,STHeiti,SimSun"><span style=
=3D"font-size:13px;font-family:simsun,STSongti-SC-Regular;color:rgb(0,0,0)"=
><span style=3D"font-family:simsun,STSongti-SC-Regular;font-size:13px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;text-align:start;text-indent:0px;text-transform:none;color:rgb(0,0=
,0)">=E6=9C=AC=E9=82=AE=E4=BB=B6=E5=8F=8A=E5=85=B6=E9=99=84=E4=BB=B6=E5=90=
=AB=E6=9C=89=E9=98=BF=E9=87=8C=E5=B7=B4=E5=B7=B4=E9=9B=86=E5=9B=A2=E7=9A=84=
=E5=95=86=E4=B8=9A=E7=A7=98=E5=AF=86=E4=BF=A1=E6=81=AF=EF=BC=8C=E4=BB=85=E9=
=99=90=E4=BA=8E=E5=8F=91=E9=80=81=E7=BB=99=E4=B8=8A=E9=9D=A2=E5=9C=B0=E5=9D=
=80=E4=B8=AD=E5=88=97=E5=87=BA=E7=9A=84=E4=B8=AA=E4=BA=BA=E5=92=8C=E7=BE=A4=
=E7=BB=84=EF=BC=8C=E7=A6=81=E6=AD=A2=E4=BB=BB=E4=BD=95=E5=85=B6=E4=BB=96=E4=
=BA=BA=E4=BB=A5=E4=BB=BB=E4=BD=95=E5=BD=A2=E5=BC=8F=E4=BD=BF=E7=94=A8=EF=BC=
=88=E5=8C=85=E6=8B=AC=E4=BD=86=E4=B8=8D=E9=99=90=E4=BA=8E=E5=85=A8=E9=83=A8=
=E6=88=96=E9=83=A8=E5=88=86=E5=9C=B0=E6=B3=84=E9=9C=B2=E3=80=81=E5=A4=8D=E5=
=88=B6=E6=88=96=E6=95=A3=E5=8F=91=EF=BC=89=E6=9C=AC=E9=82=AE=E4=BB=B6=E5=8F=
=8A=E5=85=B6=E9=99=84=E4=BB=B6=E4=B8=AD=E7=9A=84=E4=BF=A1=E6=81=AF=EF=BC=8C=
=E5=A6=82=E6=9E=9C=E6=82=A8=E9=94=99=E6=94=B6=E6=9C=AC=E9=82=AE=E4=BB=B6=EF=
=BC=8C=E8=AF=B7=E6=82=A8=E7=AB=8B=E5=8D=B3=E7=94=B5=E8=AF=9D=E6=88=96=E9=82=
=AE=E4=BB=B6=E9=80=9A=E7=9F=A5=E5=8F=91=E4=BB=B6=E4=BA=BA=E5=B9=B6=E5=88=A0=
=E9=99=A4=E6=9C=AC=E9=82=AE=E4=BB=B6=E3=80=82</span><br style=3D"font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px"><span style=3D"font-family:simsun,=
STSongti-SC-Regular;font-size:13px;font-style:normal;font-variant-ligatures=
:normal;font-variant-caps:normal;font-weight:400;text-align:start;text-inde=
nt:0px;text-transform:none;color:rgb(0,0,0)">This=C2=A0email=C2=A0and=C2=A0=
its=C2=A0attachments=C2=A0contain=C2=A0confidential=C2=A0information=C2=A0f=
rom=C2=A0Alibaba=C2=A0Group,=C2=A0which=C2=A0is=C2=A0intended=C2=A0only=C2=
=A0for=C2=A0the=C2=A0person=C2=A0or=C2=A0entity=C2=A0whose=C2=A0address=C2=
=A0is=C2=A0listed=C2=A0above.=C2=A0Any=C2=A0use=C2=A0of=C2=A0information=C2=
=A0contained=C2=A0herein=C2=A0in=C2=A0any=C2=A0way=C2=A0(including,=C2=A0bu=
t=C2=A0not=C2=A0limited=C2=A0to,=C2=A0total=C2=A0or=C2=A0partial=C2=A0discl=
osure,=C2=A0reproduction=C2=A0or=C2=A0dissemination)=C2=A0by=C2=A0persons=
=C2=A0other=C2=A0than=C2=A0the=C2=A0intended=C2=A0recipient(s)=C2=A0is=C2=
=A0prohibited.=C2=A0If=C2=A0you=C2=A0receive=C2=A0this=C2=A0email=C2=A0in=
=C2=A0error,=C2=A0please=C2=A0notify=C2=A0the=C2=A0sender=C2=A0by=C2=A0phon=
e=C2=A0or=C2=A0email=C2=A0immediately=C2=A0and=C2=A0delete=C2=A0it.</span><=
/span></div><span style=3D"font-family:Helvetica,Tahoma,Arial,&quot;PingFan=
g SC&quot;,&quot;Hiragino Sans GB&quot;,&quot;WenQuanYi Micro Hei&quot;,&qu=
ot;Microsoft YaHei&quot;,=E5=AE=8B=E4=BD=93,sans-serif;font-size:12px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;text-align:left;text-indent:0px;text-transform:none;color:rgb(111,=
112,114)"><br></span></div><div style=3D"clear:both;font-family:Tahoma,Aria=
l,STHeiti,SimSun"><br></div></div></div></blockquote></div></div>

--0000000000009f34f605b2b18f1a--
