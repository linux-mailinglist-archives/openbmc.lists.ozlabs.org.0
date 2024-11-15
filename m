Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B41B29CDA65
	for <lists+openbmc@lfdr.de>; Fri, 15 Nov 2024 09:23:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XqVQ81ZN3z3c3x
	for <lists+openbmc@lfdr.de>; Fri, 15 Nov 2024 19:22:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::435"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731658973;
	cv=none; b=DNgk4XuH8+7EZY5v/1LYepG6E6TNnnH38QL/4xqyInIsPNYOnqn3OyKuZcR3KxVEtxrITra8Gro8Pc14zD+ipuLiTxBKKQ9OuqGB9/8OmGSUFZ29Gq8skY27bTKSxGHLZAETsvI9mtCfjPH7ZJRyMqTkvgRKXmZHVjhwx1x7kZC5gRwLRpDbwTD/DWD6Z+d9ivq7TFM3LWkuDADZjsx8ZIkMNYB4StwrtYIMJ6ugRQkf6L6nm86X7FtX0dQ91QMCfX+y0lzK3RK/y0EcPaGJjXvJJ1Ya1WkEEKmJvH5Sx975FfB+4/JtrZ+xbADEbCiVCOwFfyUjwBujBqcPrOQowQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731658973; c=relaxed/relaxed;
	bh=BBAnCD0xZivpSvqfSMOFuxPokkWvgcWgivr3lnOtDVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DJ/HhOu7P9H67tsjObmfQ2CzjiEx94aoe1CxeIklDa43m4ocHMt5CxGDnUTgib6YtZ0j8fulqiszT+p4A3ZN7h5cQ9+wzHUCAeKy7e0gHksLihcGzJjSG8Gc+RhmlS7+TxPAoE4+VHv3/9nsDTWTr5ngJuzfOr/TQ8k49ncnIrsko5IkIteAVQkw6oCCc1Wj6eyQQgHCp2a4edloNZqc/ycTyymgUPZ9KQXnaKyQaY74EX2mKCL9HddIuMh95CYxRCWmJC90w4IbMQyszUl/40wla6ZPHcr4XGiNUXYc7GHEQo7HFoqxWR+LfxxsFDChk8QlfwmSGP47UkkZ1r2dzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=IGxK9Pm1; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=zhangjian.3032@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=IGxK9Pm1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=zhangjian.3032@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XqVQ42Dzlz2xXL
	for <openbmc@lists.ozlabs.org>; Fri, 15 Nov 2024 19:22:50 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-72467c35ddeso1277820b3a.0
        for <openbmc@lists.ozlabs.org>; Fri, 15 Nov 2024 00:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1731658966; x=1732263766; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BBAnCD0xZivpSvqfSMOFuxPokkWvgcWgivr3lnOtDVg=;
        b=IGxK9Pm1EVY/F7CvAZSzHeSjnI+XAacPdAgmi1JjntjmETU7ejmOhbdsi9qAUklTcD
         0i3Wm1wGrWBgXBmr9tg2Or61LKh2LkkDn+/spAIqtWkt6YNvx3dqtRjJz/tcJDAljM87
         Byby9HWw3ky0fmYRLf50aTP6TyXosuDS63eCSRCb6LjVi/WkcVWpnDT3TcqvkUds+GnQ
         iqee9COoH8OJczfAbxjxrQHQUhI+cMGDCgncPLMSBtOIpTOHlRJGsmg1ExDUVjKTcrsw
         ivkcz8AmUL/emeo2zFTMvqlP31jbGJv9FBR7cWKmCNnIBXh353TuXVrBkRXROpOS/TWY
         2XRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731658966; x=1732263766;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BBAnCD0xZivpSvqfSMOFuxPokkWvgcWgivr3lnOtDVg=;
        b=A5H59wZAur4Hy2/iuHO1HTFbKo7/FJanzS5upehBAVzoozPSznAsSrHdfbmrtH2y2u
         ZyRYgI8R6nZ7anj3agkb2JlV6MddUhQNZ2m5HbJrysXo5D6zqLIWiYIhUq2vs9iUyX1d
         td5un62Zpq38mIb/0k7ZZBvR7NZKZ/NPtXSKkfI+xWrUrOGeheg+Z3A1/HHQZgwlmsrH
         oLp/nz5YO81pGu3XNhPR8vd93IWRakzj1DlDckNCWD5XTcpScoPCVDc+xd8XuDFZWwc2
         ZXb967eVSr2DCHmUd4artzLRUjA1lEro5oAvKfRpdBDkzwslGCwaQ5VqL/0c/eSIJhdC
         k9kw==
X-Gm-Message-State: AOJu0YwknZ/EwiMby/CNemW66iXKz7aed11aQAob1lRmWr/IM6pl8Vg4
	4JkzTn781GvSoKeDkIFfD0RFoavEMcABwxk0K4mZOJLn5CYVbcXQamZvizlhhn5qQLEGlSdSoXm
	f5x7MILHjMsGBwTtN8rUQww1wrzEWsrEkNI3pg/w6+9Mjxz/zkE8o43Yh9KEmo0yx0NA=
X-Google-Smtp-Source: AGHT+IExzAOvTFHPEeQSUXjZrHBANlc9gZBvtdomnbWAaowrFw6vwVz5q2vr1bJLV0XiMrIqi2Q/Jx+ijswU1syMCi8=
X-Received: by 2002:a05:6a00:1747:b0:724:6757:7d95 with SMTP id
 d2e1a72fcca58-72475fb8c61mr3532860b3a.5.1731658965949; Fri, 15 Nov 2024
 00:22:45 -0800 (PST)
MIME-Version: 1.0
References: <18393666.6642.1931e8207af.Coremail.yubowei0982@phytium.com.cn> <607cb6f4.693a.193241ef1d4.Coremail.yubowei0982@phytium.com.cn>
In-Reply-To: <607cb6f4.693a.193241ef1d4.Coremail.yubowei0982@phytium.com.cn>
From: Zhang Jian <zhangjian.3032@bytedance.com>
Date: Fri, 15 Nov 2024 16:22:34 +0800
Message-ID: <CA+J-oUsMxRjDVSa5spbmV21=qRTBBgBk20zM3tty_YzCdaCGEA@mail.gmail.com>
Subject: Re: [External] Re: BMCWEB debug question
To: =?UTF-8?B?5Za75p+P54Kc?= <yubowei0982@phytium.com.cn>
Content-Type: multipart/alternative; boundary="00000000000089b1520626ef45b7"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_FONT_FACE_BAD,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

--00000000000089b1520626ef45b7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

PiBUaGlzIHNlcmllcnMgb2YgYWN0aW9ucyBjb3N0IG1lIHRvbyBtdWNoIHRpbWUuSSBkb24ndCB0
aGluayBpdCBpcyBhIHJpZ2h0DQpkZXZlbG9wIGZsb3cgYXMgYSB3ZWIgZW5naW5lZXIuQ291bGQg
dSBzaG93IG1lIHJpZ2h0IHdheSBmb3IgZGVidWdpbmc/DQoNCkJhc2VkIG9uIHRoZSBpbmZvcm1h
dGlvbiBJIGhhdmUsIHRoaXMgaXMgdGhlIGNvcnJlY3QgYXBwcm9hY2gsIGJlY2F1c2UNCmJtY3dl
YiBpcyBoZWFkZXItb25seSwNCmFuZCBhbnkgc21hbGwgbW9kaWZpY2F0aW9uIHdpbGwgYmFzaWNh
bGx5IHJlc3VsdCBpbiBhIGZ1bGwgcmVjb21waWxhdGlvbi4NCg0KDQpPbiBUaHUsIE5vdiAxNCwg
MjAyNCBhdCA2OjA24oCvQU0g5Za75p+P54KcIDx5dWJvd2VpMDk4MkBwaHl0aXVtLmNvbS5jbj4g
d3JvdGU6DQoNCj4gV2FpdHRpbmcgZm9yIHlvdXIgcmVwbHksdGhhbmtzIQ0KPg0KPg0KPg0KPiAt
LS0tLeWOn+Wni+mCruS7ti0tLS0tDQo+ICrlj5Hku7bkuro6KiDllrvmn4/ngpwgPHl1Ym93ZWkw
OTgyQHBoeXRpdW0uY29tLmNuPg0KPiAq5Y+R6YCB5pe26Ze0OiogMjAyNC0xMS0xMiAxMTo1NDox
OCAo5pif5pyf5LqMKQ0KPiAq5pS25Lu25Lq6Oiogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQo+
ICrkuLvpopg6KiBCTUNXRUIgZGVidWcgcXVlc3Rpb24NCj4NCj4gSGVsbG8scG0NCj4NCj4NCj4g
RWFjaCB0aW1lIGRlYnVnaW5nIGEgZnVuY2lvbiBvZiBvbmUgbGluZSBjb2RlIHdpbGwgY29zdCBt
ZSB0b28gbXVjaCB0aW1lLg0KPiAxLnR5cGUgImJpdGJha2UgYm1jd2ViIix0aGlzIGFjdGlvbiB3
aWxsIGNvc3QgbWUgNSBtaW51dGVzLg0KPiAyLlJlcGxhY2UgYm1jd2ViIGJpbmFyeSBmaWxlLg0K
PiAzLnJlYm9vdCBibWN3ZWIuDQo+DQo+IFRoaXMgc2VyaWVycyBvZiBhY3Rpb25zIGNvc3QgbWUg
dG9vIG11Y2ggdGltZS5JIGRvbid0IHRoaW5rIGl0IGlzIGEgcmlnaHQNCj4gZGV2ZWxvcCBmbG93
IGFzIGEgd2ViIGVuZ2luZWVyLkNvdWxkIHUgc2hvdyBtZSByaWdodCB3YXkgZm9yIGRlYnVnaW5n
Pw0KPg0KPg0KPiBUaGUgc2Vjb25kIHF1ZXN0aW9uIGlzIHRoYXQgSSBkaWRuJ3QgZmluZCBhbnkg
YWN0aW9uIHJlbGF0ZSB3aXRoICJtZXNvbg0KPiBzZXR1cCBidWlsZGRlciAmJiBuaW5qYSAiIGlu
IGJtY3dlYi5iYi5Ib3cgZG9lcyBpdCB3b3JrP2hvdyBjYW4gSSB1c2UNCj4g4oCcSW5jcmVtZW50
YWwgSW1wbGVtZW50YXRpb27igJ0gdG8gZGVjcmVhc2Ugd2FzdGUgdGltZSBpbiBhY3Rpb24gImJp
dGJha2UNCj4gYm1jd2ViIiB3aGljaCBjb3N0IG1lIHRvbyBtdWNoIHRpbWUuDQo+DQo+DQo+IFRo
ZSB0aGlyZCBxdWVzdGlvbi5Eb3NlIGJtY3dlYiBoYXZlIEhvdCBEZXBsb3ltZW50IG1ldGhvZD9N
dXN0IEkgcmVwbGFjZQ0KPiBiaW5hcnkgYm1jd2ViIGluIG9ibWMtcGhvc3Bob3ItaW1hZ2UgZm9y
IGRldGVjdHRpbmcgd3JpdGluZyByZXN1bHQ/DQo+DQo+IERvc2UgaXQgZXhpc3QgYSBmdW5jdGlv
biB0byBkZXRlY3QgcmVzdWx0IG1vcmUgY29udmluZW50bHkgbGlrZSBucG0gcnVuDQo+IHNlcnZl
IGluIHdlYnVpLXZ1ZSx0aGF0IGlzIG1vcmUgY29udmVuaWVudCBhbmQgbW9yZSBzYWZlLkl0IHVz
ZWQgcHJveHkgYW5kDQo+IHdpbGwgbmV2ZXIgcmVwbGFjZSBiaW5hcnkgZmlsZSBpbiBvYm1jLg0K
Pg0KPg0KPiBUaGFua3MhDQo+DQo+DQo+DQo+DQo+DQo+ICrkv6Hmga/lronlhajlo7DmmI7vvJrm
nKzpgq7ku7bljIXlkKvkv6Hmga/lvZLlj5Hku7bkurrmiYDlnKjnu4Tnu4fmiYDmnIks5Y+R5Lu2
5Lq65omA5Zyo57uE57uH5a+56K+l6YKu5Lu25oul5pyJ5omA5pyJ5p2D5Yip44CC6K+35o6l5pS2
6ICF5rOo5oSP5L+d5a+GLOacque7j+WPkeS7tuS6uuS5pumdouiuuOWPryzkuI3lvpflkJHku7vk
vZXnrKzkuInmlrnnu4Tnu4flkozkuKrkurrpgI/pnLLmnKzpgq7ku7bmiYDlkKvkv6Hmga/jgIJJ
bmZvcm1hdGlvbg0KPiBTZWN1cml0eSBOb3RpY2U6IFRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQg
aW4gdGhpcyBtYWlsIGlzIHNvbGVseSBwcm9wZXJ0eQ0KPiBvZiB0aGUgc2VuZGVyJ3Mgb3JnYW5p
emF0aW9uLlRoaXMgbWFpbCBjb21tdW5pY2F0aW9uIGlzDQo+IGNvbmZpZGVudGlhbC5SZWNpcGll
bnRzIG5hbWVkIGFib3ZlIGFyZSBvYmxpZ2F0ZWQgdG8gbWFpbnRhaW4gc2VjcmVjeSBhbmQNCj4g
YXJlIG5vdCBwZXJtaXR0ZWQgdG8gZGlzY2xvc2UgdGhlIGNvbnRlbnRzIG9mIHRoaXMgY29tbXVu
aWNhdGlvbiB0byBvdGhlcnMuKg0KPg0KPg0KPg0KPg0KPiAq5L+h5oGv5a6J5YWo5aOw5piO77ya
5pys6YKu5Lu25YyF5ZCr5L+h5oGv5b2S5Y+R5Lu25Lq65omA5Zyo57uE57uH5omA5pyJLOWPkeS7
tuS6uuaJgOWcqOe7hOe7h+WvueivpemCruS7tuaLpeacieaJgOacieadg+WIqeOAguivt+aOpeaU
tuiAheazqOaEj+S/neWvhizmnKrnu4/lj5Hku7bkurrkuabpnaLorrjlj68s5LiN5b6X5ZCR5Lu7
5L2V56ys5LiJ5pa557uE57uH5ZKM5Liq5Lq66YCP6Zyy5pys6YKu5Lu25omA5ZCr5L+h5oGv44CC
SW5mb3JtYXRpb24NCj4gU2VjdXJpdHkgTm90aWNlOiBUaGUgaW5mb3JtYXRpb24gY29udGFpbmVk
IGluIHRoaXMgbWFpbCBpcyBzb2xlbHkgcHJvcGVydHkNCj4gb2YgdGhlIHNlbmRlcidzIG9yZ2Fu
aXphdGlvbi5UaGlzIG1haWwgY29tbXVuaWNhdGlvbiBpcw0KPiBjb25maWRlbnRpYWwuUmVjaXBp
ZW50cyBuYW1lZCBhYm92ZSBhcmUgb2JsaWdhdGVkIHRvIG1haW50YWluIHNlY3JlY3kgYW5kDQo+
IGFyZSBub3QgcGVybWl0dGVkIHRvIGRpc2Nsb3NlIHRoZSBjb250ZW50cyBvZiB0aGlzIGNvbW11
bmljYXRpb24gdG8gb3RoZXJzLioNCg==
--00000000000089b1520626ef45b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">&gt;=C2=
=A0<font color=3D"#1f2328" face=3D"-apple-system, system-ui, Segoe UI, Noto=
 Sans, Helvetica, Arial, sans-serif, Apple Color Emoji, Segoe UI Emoji">Thi=
s </font>seriers<font color=3D"#1f2328" face=3D"-apple-system, system-ui, S=
egoe UI, Noto Sans, Helvetica, Arial, sans-serif, Apple Color Emoji, Segoe =
UI Emoji"> of actions cost me too much time.I don&#39;t think it is a right=
 </font>develop<font color=3D"#1f2328" face=3D"-apple-system, system-ui, Se=
goe UI, Noto Sans, Helvetica, Arial, sans-serif, Apple Color Emoji, Segoe U=
I Emoji"> flow as a web engineer.Could u show </font>me right<font color=3D=
"#1f2328" face=3D"-apple-system, system-ui, Segoe UI, Noto Sans, Helvetica,=
 Arial, sans-serif, Apple Color Emoji, Segoe UI Emoji"> way for </font>debu=
ging<font color=3D"#1f2328" face=3D"-apple-system, system-ui, Segoe UI, Not=
o Sans, Helvetica, Arial, sans-serif, Apple Color Emoji, Segoe UI Emoji">?<=
/font><br><br><font color=3D"#1f2328" face=3D"-apple-system, system-ui, Seg=
oe UI, Noto Sans, Helvetica, Arial, sans-serif, Apple Color Emoji, Segoe UI=
 Emoji">Based on the information I have, this is the correct approach, beca=
use bmcweb=C2=A0is header-only,=C2=A0</font></div><div dir=3D"ltr"><font co=
lor=3D"#1f2328" face=3D"-apple-system, system-ui, Segoe UI, Noto Sans, Helv=
etica, Arial, sans-serif, Apple Color Emoji, Segoe UI Emoji">and any small =
modification will basically result in a full recompilation.</font></div><br=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Th=
u, Nov 14, 2024 at 6:06=E2=80=AFAM =E5=96=BB=E6=9F=8F=E7=82=9C &lt;<a href=
=3D"mailto:yubowei0982@phytium.com.cn">yubowei0982@phytium.com.cn</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><p>Waitting for your reply,thanks!</p><p><br></p><p><br></p><block=
quote name=3D"replyContent" style=3D"padding-left:5px;margin-left:5px;borde=
r-left:2px solid rgb(182,182,182);margin-right:0px">-----=E5=8E=9F=E5=A7=8B=
=E9=82=AE=E4=BB=B6-----<br>
<b>=E5=8F=91=E4=BB=B6=E4=BA=BA:</b> <span id=3D"m_-2201147435295104490rc_fr=
om">=E5=96=BB=E6=9F=8F=E7=82=9C &lt;<a href=3D"mailto:yubowei0982@phytium.c=
om.cn" target=3D"_blank">yubowei0982@phytium.com.cn</a>&gt;</span><br>
<b>=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:</b> <span id=3D"m_-220114743529510=
4490rc_senttime">2024-11-12 11:54:18 (=E6=98=9F=E6=9C=9F=E4=BA=8C)</span><b=
r>
<b>=E6=94=B6=E4=BB=B6=E4=BA=BA:</b> <a href=3D"mailto:openbmc@lists.ozlabs.=
org" target=3D"_blank">openbmc@lists.ozlabs.org</a><br>
<b>=E4=B8=BB=E9=A2=98:</b> BMCWEB debug question<br><br><div dir=3D"ltr"><p=
 dir=3D"auto" style=3D"box-sizing:border-box;color:rgb(31,35,40);font-famil=
y:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Noto Sans&quo=
t;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI =
Emoji&quot;;background-color:rgb(255,255,255)">Hello,pm</p><p dir=3D"auto" =
style=3D"box-sizing:border-box;color:rgb(31,35,40);font-family:-apple-syste=
m,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Noto Sans&quot;,Helvetica,A=
rial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;ba=
ckground-color:rgb(255,255,255)"><br></p><p dir=3D"auto" style=3D"box-sizin=
g:border-box;color:rgb(31,35,40);font-family:-apple-system,BlinkMacSystemFo=
nt,&quot;Segoe UI&quot;,&quot;Noto Sans&quot;,Helvetica,Arial,sans-serif,&q=
uot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;background-color:rgb=
(255,255,255)">Each time debuging a funcion of one line code will cost me t=
oo much time.<br style=3D"box-sizing:border-box">1.type &quot;bitbake bmcwe=
b&quot;,this action will cost me 5 minutes.<br style=3D"box-sizing:border-b=
ox">2.Replace bmcweb binary file.<br style=3D"box-sizing:border-box">3.rebo=
ot bmcweb.</p><p dir=3D"auto" style=3D"box-sizing:border-box;color:rgb(31,3=
5,40);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&qu=
ot;Noto Sans&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;=
,&quot;Segoe UI Emoji&quot;;background-color:rgb(255,255,255)">This seriers=
 of actions cost me too much time.I don&#39;t think it is a right develop f=
low as a web engineer.Could u show me right way for debuging?</p><p dir=3D"=
auto" style=3D"box-sizing:border-box;color:rgb(31,35,40);font-family:-apple=
-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Noto Sans&quot;,Helve=
tica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&qu=
ot;;background-color:rgb(255,255,255)"><br></p><p dir=3D"auto" style=3D"box=
-sizing:border-box;color:rgb(31,35,40);font-family:-apple-system,BlinkMacSy=
stemFont,&quot;Segoe UI&quot;,&quot;Noto Sans&quot;,Helvetica,Arial,sans-se=
rif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;background-col=
or:rgb(255,255,255)">The second question is that I didn&#39;t find any acti=
on relate with &quot;meson setup buildder &amp;&amp; ninja &quot; in bmcweb=
.bb.How does it work?how can I use =E2=80=9CIncremental Implementation=E2=
=80=9D to decrease waste time in action &quot;bitbake bmcweb&quot; which co=
st me too much time.</p><p dir=3D"auto" style=3D"box-sizing:border-box;colo=
r:rgb(31,35,40);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI=
&quot;,&quot;Noto Sans&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color E=
moji&quot;,&quot;Segoe UI Emoji&quot;;background-color:rgb(255,255,255)"><b=
r></p><p dir=3D"auto" style=3D"box-sizing:border-box;color:rgb(31,35,40);fo=
nt-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Noto =
Sans&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;S=
egoe UI Emoji&quot;;background-color:rgb(255,255,255)">The third question.D=
<span style=3D"color:rgb(31,35,40);font-family:-apple-system,BlinkMacSystem=
Font,&quot;Segoe UI&quot;,&quot;Noto Sans&quot;,Helvetica,Arial,sans-serif,=
&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;background-color:r=
gb(255,255,255)">ose bmcweb have Hot Deployment method?<span style=3D"color=
:rgb(31,35,40);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&=
quot;,&quot;Noto Sans&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Em=
oji&quot;,&quot;Segoe UI Emoji&quot;;background-color:rgb(255,255,255)">Mus=
t I replace binary bmcweb in obmc-phosphor-image for detectting writing res=
ult?</span></span></p><p><span style=3D"color:rgb(31,35,40);font-family:-ap=
ple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Noto Sans&quot;,He=
lvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji=
&quot;;background-color:rgb(255,255,255)">Dose it exist a function to detec=
t result more convinently like npm run serve in webui-vue,that is more conv=
enient and more safe.It used proxy and will never replace binary file in ob=
mc.</span></p><p><br style=3D"box-sizing:border-box;color:rgb(31,35,40);fon=
t-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Noto S=
ans&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Se=
goe UI Emoji&quot;;background-color:rgb(255,255,255)"></p><p><span style=3D=
"color:rgb(31,35,40);font-family:-apple-system,BlinkMacSystemFont,&quot;Seg=
oe UI&quot;,&quot;Noto Sans&quot;,Helvetica,Arial,sans-serif,&quot;Apple Co=
lor Emoji&quot;,&quot;Segoe UI Emoji&quot;;background-color:rgb(255,255,255=
)">Thanks!</span></p><p dir=3D"auto" style=3D"box-sizing:border-box;color:r=
gb(31,35,40);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&qu=
ot;,&quot;Noto Sans&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoj=
i&quot;,&quot;Segoe UI Emoji&quot;;background-color:rgb(255,255,255)"><span=
 style=3D"color:rgb(31,35,40);font-family:-apple-system,BlinkMacSystemFont,=
&quot;Segoe UI&quot;,&quot;Noto Sans&quot;,Helvetica,Arial,sans-serif,&quot=
;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;background-color:rgb(25=
5,255,255)"></span><br></p></div><br><br><i style=3D"color:rgb(119,119,119)=
;font-family:=E5=AE=8B=E4=BD=93;font-size:x-small">=E4=BF=A1=E6=81=AF=E5=AE=
=89=E5=85=A8=E5=A3=B0=E6=98=8E=EF=BC=9A=E6=9C=AC=E9=82=AE=E4=BB=B6=E5=8C=85=
=E5=90=AB=E4=BF=A1=E6=81=AF=E5=BD=92=E5=8F=91=E4=BB=B6=E4=BA=BA=E6=89=80=E5=
=9C=A8=E7=BB=84=E7=BB=87=E6=89=80=E6=9C=89,=E5=8F=91=E4=BB=B6=E4=BA=BA=E6=
=89=80=E5=9C=A8=E7=BB=84=E7=BB=87=E5=AF=B9=E8=AF=A5=E9=82=AE=E4=BB=B6=E6=8B=
=A5=E6=9C=89=E6=89=80=E6=9C=89=E6=9D=83=E5=88=A9=E3=80=82=E8=AF=B7=E6=8E=A5=
=E6=94=B6=E8=80=85=E6=B3=A8=E6=84=8F=E4=BF=9D=E5=AF=86,=E6=9C=AA=E7=BB=8F=
=E5=8F=91=E4=BB=B6=E4=BA=BA=E4=B9=A6=E9=9D=A2=E8=AE=B8=E5=8F=AF,=E4=B8=8D=
=E5=BE=97=E5=90=91=E4=BB=BB=E4=BD=95=E7=AC=AC=E4=B8=89=E6=96=B9=E7=BB=84=E7=
=BB=87=E5=92=8C=E4=B8=AA=E4=BA=BA=E9=80=8F=E9=9C=B2=E6=9C=AC=E9=82=AE=E4=BB=
=B6=E6=89=80=E5=90=AB=E4=BF=A1=E6=81=AF=E3=80=82<br>Information Security No=
tice: The information contained in this mail is solely property of the send=
er&#39;s organization.This mail communication is confidential.Recipients na=
med above are obligated to maintain secrecy and are not permitted to disclo=
se the contents of this communication to others.</i></blockquote></div><br>=
<br><i style=3D"color:rgb(119,119,119);font-family:=E5=AE=8B=E4=BD=93;font-=
size:x-small">=E4=BF=A1=E6=81=AF=E5=AE=89=E5=85=A8=E5=A3=B0=E6=98=8E=EF=BC=
=9A=E6=9C=AC=E9=82=AE=E4=BB=B6=E5=8C=85=E5=90=AB=E4=BF=A1=E6=81=AF=E5=BD=92=
=E5=8F=91=E4=BB=B6=E4=BA=BA=E6=89=80=E5=9C=A8=E7=BB=84=E7=BB=87=E6=89=80=E6=
=9C=89,=E5=8F=91=E4=BB=B6=E4=BA=BA=E6=89=80=E5=9C=A8=E7=BB=84=E7=BB=87=E5=
=AF=B9=E8=AF=A5=E9=82=AE=E4=BB=B6=E6=8B=A5=E6=9C=89=E6=89=80=E6=9C=89=E6=9D=
=83=E5=88=A9=E3=80=82=E8=AF=B7=E6=8E=A5=E6=94=B6=E8=80=85=E6=B3=A8=E6=84=8F=
=E4=BF=9D=E5=AF=86,=E6=9C=AA=E7=BB=8F=E5=8F=91=E4=BB=B6=E4=BA=BA=E4=B9=A6=
=E9=9D=A2=E8=AE=B8=E5=8F=AF,=E4=B8=8D=E5=BE=97=E5=90=91=E4=BB=BB=E4=BD=95=
=E7=AC=AC=E4=B8=89=E6=96=B9=E7=BB=84=E7=BB=87=E5=92=8C=E4=B8=AA=E4=BA=BA=E9=
=80=8F=E9=9C=B2=E6=9C=AC=E9=82=AE=E4=BB=B6=E6=89=80=E5=90=AB=E4=BF=A1=E6=81=
=AF=E3=80=82<br>Information Security Notice: The information contained in t=
his mail is solely property of the sender&#39;s organization.This mail comm=
unication is confidential.Recipients named above are obligated to maintain =
secrecy and are not permitted to disclose the contents of this communicatio=
n to others.</i></blockquote></div></div></div></div>

--00000000000089b1520626ef45b7--
