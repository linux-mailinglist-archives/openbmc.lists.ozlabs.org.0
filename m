Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BF3325237
	for <lists+openbmc@lfdr.de>; Thu, 25 Feb 2021 16:20:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dmc0b23ngz3cjg
	for <lists+openbmc@lfdr.de>; Fri, 26 Feb 2021 02:19:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=OYUpQ0JY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::529;
 helo=mail-ed1-x529.google.com; envelope-from=parishrutb@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OYUpQ0JY; dkim-atps=neutral
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dmc0L6C98z3cYy
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2021 02:19:44 +1100 (AEDT)
Received: by mail-ed1-x529.google.com with SMTP id h10so7335535edl.6
 for <openbmc@lists.ozlabs.org>; Thu, 25 Feb 2021 07:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=IgfyBBizeQB1KtJCOZLksZCt6vnmhfxKz6MB4zCrlr0=;
 b=OYUpQ0JYn9TXVZHtd/+V0WmCRfx5PaO56pL5DaQyOr/wnu8D5pgahgaTGQd53R6ju9
 cktZlCnl716t+BoKqPYaUcQluCd+10L0GlFVNq6IZwweYH2yYPLs/kqGQe7a4pn/nk42
 Qz/Gw87dyfYSMWwlBRmiwH7+l7/Pd/3INZTKzFVmnXh/66JQ9rAxVr1ZYM+YAT4hU3Eq
 T0TccAECszg9PAgYH6sy7e+78J0x1nAYbpe2yHqfU4XtRjhZuQaHSekHCYen+GeY2+Jo
 lSceRCF8XB31opwd5PflHjWqYyR0JCW8vvlK1bYrCNXBB8Qyl3fJtehRLimswD4UCgX4
 Z7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=IgfyBBizeQB1KtJCOZLksZCt6vnmhfxKz6MB4zCrlr0=;
 b=Y+ojuPYzUTb2oVzczzJ7nONRiO+ES/Phz6mIR0TthspKe/BplgDUaKp4mOMvXlaVpM
 zYYJma8N3i8OvE47vEDuPjLCscJrpThp4PuE5b51MJRMTzZUFqiXeADoT+VMF/K4dmxX
 Cni5Uyn85bw7eGMyg30DIh5d50t1Kx3eWkkgYaEchW/keNZ4l3Xg1KEnEXHmrZxBPEar
 6B3NA9bbsCabpqACX0TBPU53Hf59Lp1+a0FXmjIYKvEIt9CvNBe2iHg9M0GGsL908Y9w
 PjXNfpfsdke9iJBhYFIa4cd2hEgRRrHvs7C2eWXgRLZkm24bHNmtVRZEDL+uFvr79nO6
 Yvow==
X-Gm-Message-State: AOAM531CMd8nJ8avNMml3zQnHNVSjCmFYimdWa63o4Dt4lKMCAn0URI8
 VnAYNoeicR5ZxTPyb3hjWgpPRXZ9i/RiNMOEoChLqgT9yYO8Kg==
X-Google-Smtp-Source: ABdhPJxezLCcvN3niuhRM0OtHB7Q+c7aykVYNELDfNkM7mnat8FVf1JZhLjX2vv01L3fz9iCEv0/FXYTLWT1qd6y1XU=
X-Received: by 2002:a05:6402:2030:: with SMTP id
 ay16mr3444901edb.156.1614266379030; 
 Thu, 25 Feb 2021 07:19:39 -0800 (PST)
MIME-Version: 1.0
References: <CA+FKyEWtGpmB9P4YUryOprn7GG604f27MV27KAG6bs72zNo_ew@mail.gmail.com>
In-Reply-To: <CA+FKyEWtGpmB9P4YUryOprn7GG604f27MV27KAG6bs72zNo_ew@mail.gmail.com>
From: Parishrut Bhatia <parishrutb@gmail.com>
Date: Thu, 25 Feb 2021 20:49:26 +0530
Message-ID: <CA+FKyEV8xSPOOZCknSq93Y0EkbTGATi5w_SHHyaJrHOsQ7VqeA@mail.gmail.com>
Subject: Requesting feedback on in-progress GUI designs (Hardware status and
 inventory)
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000018523505bc2aae5b"
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

--00000000000018523505bc2aae5b
Content-Type: text/plain; charset="UTF-8"

Hello,

Requesting feedback on the current iteration of new Hardware status and
inventory screens in the WebUI:
https://github.com/openbmc/webui-vue/issues/54
<https://github.com/openbmc/webui-vue/issues/44>
Thanks in advance,
*Parishrut Bhatia*
User Experience Designer | IBM iX, Bangalore
+91 9811 930 069

*"Everyone wants to go to heaven, but no one wants to die."*

--00000000000018523505bc2aae5b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello,</div><div><br></div><div>Requ=
esting feedback on the current iteration of new Hardware status and invento=
ry screens in the WebUI:<br></div><div><a href=3D"https://github.com/openbm=
c/webui-vue/issues/54">https://github.com/openbmc/webui-vue/issues/54</a></=
div><div><a href=3D"https://github.com/openbmc/webui-vue/issues/44" target=
=3D"_blank"></a></div><div>Thanks in advance<font color=3D"#888888">,<br></=
font></div><font color=3D"#888888"></font><div><div dir=3D"ltr" class=3D"gm=
ail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><di=
v dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr">=
<div style=3D"font-size:12.72px"><span style=3D"background-color:rgb(255,25=
5,255)"><font style=3D"font-size:12.72px" face=3D"tahoma, sans-serif"><b>Pa=
rishrut Bhatia</b></font></span><div style=3D"font-size:12.72px"><span styl=
e=3D"color:rgb(102,102,102)"><span style=3D"background-color:rgb(255,255,25=
5)"><span style=3D"font-family:tahoma,sans-serif;font-size:small">User Expe=
rience Designer | IBM iX, Bangalore</span></span></span></div><div style=3D=
"font-size:12.72px"><span style=3D"color:rgb(102,102,102)"><span style=3D"b=
ackground-color:rgb(255,255,255)"><span style=3D"font-family:tahoma,sans-se=
rif;font-size:12.72px">+91 9811 930 069</span></span></span></div><div styl=
e=3D"font-size:12.72px"><span style=3D"background-color:rgb(255,255,255)"><=
br></span></div><div style=3D"font-size:12.72px"><i><span style=3D"color:rg=
b(102,102,102)"><span style=3D"background-color:rgb(255,255,255)">&quot;Eve=
ryone wants to go to heaven, but no one wants to die.&quot;</span></span></=
i><br></div><br><br></div></div></div></div></div></div></div></div></div><=
/div></div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
</blockquote></div></div>

--00000000000018523505bc2aae5b--
