Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C431C8560
	for <lists+openbmc@lfdr.de>; Thu,  7 May 2020 11:11:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Hnkb4vjGzDqXw
	for <lists+openbmc@lfdr.de>; Thu,  7 May 2020 19:11:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=zbigniewku@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AkyKyfMc; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HnjJ0BVCzDqvT
 for <openbmc@lists.ozlabs.org>; Thu,  7 May 2020 19:09:55 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id x77so2734242pfc.0
 for <openbmc@lists.ozlabs.org>; Thu, 07 May 2020 02:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6UEaxkVlF4FAtitd6shaFzRFidiaZCmyCQJxA9W4RlM=;
 b=AkyKyfMccKnL1hE/9TtMfzn9RP/4WFceJZApYCMRsb0qfSO0Z3BjsmLj/a9xoBFTod
 LmIuj6sFEuAZbz2/69uR5aLULbapG2Z1GzleQEKPnJz/Inw4i7dYmEJSO+Vhyz8XsDwJ
 ayLF8jtTiP5nIlM3pA24yMFT2LYGM9Kf5RVDoYLxCRn7Fysn+siTshghQzSpghpVDEmd
 sGPhJzDaWEqlb0Ao5E69H9GbzbtoffSR1GUmb5tC/Sx1v2o41YOvTqncKGuNz2DBzIMy
 I35Xrq2gIaUrf4vWniMRcdu72NcNKPTgeZtIiqCpMpC9MrsbhumV6RgGKNb8vGtwuDoF
 kEWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6UEaxkVlF4FAtitd6shaFzRFidiaZCmyCQJxA9W4RlM=;
 b=Ue1oR7MQGJCWsBZOPPhMeeot3Rvpua2b958nBd8hCqr3QK932pTFwUKtVCnF6eu1Co
 b4opHucC47ljdg9j2HC4FBmEhj+ISIuqM2tp2MtqWPR1LDztV+i0Y3/XDUrjokHyBhUU
 XM8B0e2sYTAVgJGptEsSNXlgTBXz9TWdxgpQEJWUYCQgZhSJ6AnTJRX1kwFBSW7EwFKa
 cLNhY2usKrvFUpAjIPvWorl0dJmm6B9DtupuJm8umcGmfhLRug6phhOWPoZda064LMjK
 vDS0FiLNG3xXGR5uC+gVT0csfnve28XcHVx4JbzjwP9ZVD/oJ/BJqcs0NJsfCF7OOuYT
 srlg==
X-Gm-Message-State: AGi0Pua7IZjp1IYIhK0Rvpr1HnspZos2wOWyyUKn8WcBGTSgC8ArFOAS
 fbI+blivGsIWgwlcpqaUZblTnkUBLb7Tkwn2F7k=
X-Google-Smtp-Source: APiQypI8QqRiCNTbHkPzy/yZenitugSphgVWoDjpplWBWUj60oarEbKg4zgBF8HCXT1jSaHDJyLe9buEKrwx5sp5xZc=
X-Received: by 2002:a62:1a0d:: with SMTP id a13mr12480633pfa.229.1588842591234; 
 Thu, 07 May 2020 02:09:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAMXw96Mnk8Hf4wAB_Ot=XEqp9yecspPfMGB6oF_LSgjRFMNHvw@mail.gmail.com>
 <CAB_SOc5tEo7xRg65aMfBOWyY_yXkb6+mLmRhf8hifNhHDWGVgQ@mail.gmail.com>
 <CAMXw96NoWn+sZELD1Xd=WUyLwvOUZ9prKyqqaLFKiMwM6ChuMw@mail.gmail.com>
 <CAB_SOc6pgn2OXd-KRYNpzszxWyhfGOdBTHMB5FWbat8QaZ1CoQ@mail.gmail.com>
 <CH2PR21MB1510B40F09178BC841F62AA6C8A50@CH2PR21MB1510.namprd21.prod.outlook.com>
In-Reply-To: <CH2PR21MB1510B40F09178BC841F62AA6C8A50@CH2PR21MB1510.namprd21.prod.outlook.com>
From: Zbyszek <zbigniewku@gmail.com>
Date: Thu, 7 May 2020 11:09:40 +0200
Message-ID: <CAB_SOc7dz7ARKH5W-d7EwrFnLxd0V3Ny7i3xyxGGGxHTGW0LOg@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [bmcweb] mTLS client authentication always succeeds
To: Neeraj Ladkani <neladk@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Zhenfei Tai <ztai@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

czw., 7 maj 2020 o 10:14 Neeraj Ladkani <neladk@microsoft.com> napisa=C5=82=
(a):
>
> Hi Zbyszek,
>
> Just a basic question, Once bmcweb is configured with -DBMCWEB_ENABLE_MUT=
UAL_TLS_AUTHENTICATION, can it work without client cert?


Yes it can, by default all authentication methods are enabled except TLS.
Which method is enabled can be checked via redfish service
AccountService->Oem->OpenBMC->AuthMethods.
To change these settings send PATCH to
https://{{bmc_ip}}/redfish/v1/AccountService.
For example to turn the tls use this patch body :  {"Oem": {"OpenBMC":
{"AuthMethods": {"TLS": true}}}}

I think this diagram at paragraph 'Authentication Process'
https://github.com/openbmc/docs/blob/master/designs/redfish-tls-user-authen=
tication.md
can be useful in understanding how the authentication process flow looks li=
ke.
(now I see that some parts of this design, like paths requires
updates, but the diagram is valid).


>
> It will be good to document curl APIs to enable this feature and test end=
 to end flows.
>
> Thanks
> Neeraj
>
> -----Original Message-----
> From: openbmc <openbmc-bounces+neladk=3Dmicrosoft.com@lists.ozlabs.org> O=
n Behalf Of Zbyszek
> Sent: Thursday, May 7, 2020 12:49 AM
> To: Zhenfei Tai <ztai@google.com>
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Subject: [EXTERNAL] Re: [bmcweb] mTLS client authentication always succee=
ds
>
> =C5=9Br., 6 maj 2020 o 20:19 Zhenfei Tai <ztai@google.com> napisa=C5=82(a=
):
> >
> > Hi Zbyszek,
> >
> > Thanks for your reply. I look forward to the official documentation.
> >
> > The callback function returns true when preverified =3D=3D false. Not s=
ure why it should always return true, which accepts any client certificate.
>
> Yes, always returning true we do not break the tls handshake allowing for=
 connection.
> But user will not be authenticated anyway because its name will not be ex=
tracted from the certificate.
> In such case user should receive proper http error code telling he is not=
 authenticated.
>
> >
> > // We always return true to allow full auth flow if (!preverified) {
> > BMCWEB_LOG_DEBUG << this << " TLS preverification failed."; return
> > true; }
> >
> > Thanks,
> > Zhenfei
> >
> > On Wed, May 6, 2020 at 4:22 AM Zbyszek <zbigniewku@gmail.com> wrote:
> >>
> >> pt., 1 maj 2020 o 02:07 Zhenfei Tai <ztai@google.com> napisa=C5=82(a):
> >> >
> >> > Hi,
> >> >
> >> > I've been testing bmcweb mTLS for a while and found the user
> >> > defined verify callback function returns true in all cases.
> >> > (https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
F
> >> > github.com%2Fopenbmc%2Fbmcweb%2Fblob%2Fmaster%2Fhttp%2Fhttp_connect
> >> > ion.h%23L287&amp;data=3D02%7C01%7Cneladk%40microsoft.com%7C8f5ff6125=
e
> >> > db4b734c3e08d7f25b2b68%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7
> >> > C637244345695157575&amp;sdata=3D3E%2F%2FdxSuR5SFo9ZII%2FZAA7h6%2FDds=
1
> >> > lHeZaCnbimciLw%3D&amp;reserved=3D0)
> >> >
> >> > If client authentication is enabled in bmcweb, should it reject if c=
lient certificate is bad?
> >>
> >> No, purpose of this callback is to only extract the user name from
> >> the certificate and then allow to proceed with default OpenSSL
> >> verification flow which should finally fail if something is wrong
> >> with the certificate no matter what this function returned.
> >> The 'set_verify_callback' doesn't replace the whole verification
> >> procedure, it only adds a callback that is called when the default
> >> validator checks each certificate. The 'preverified' parameter,
> >> passed to it indicates if verification of the certificate succeeded or=
 not.
> >> You should be able to see it in bmcweb logs.
> >>
> >> >
> >> > Thanks,
> >> > Zhenfei
