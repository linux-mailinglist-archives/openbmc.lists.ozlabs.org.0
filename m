Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3841F1D14B1
	for <lists+openbmc@lfdr.de>; Wed, 13 May 2020 15:25:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Mb5k3CwkzDqbp
	for <lists+openbmc@lfdr.de>; Wed, 13 May 2020 23:25:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=zbigniewku@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Iz9hMBHq; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Mb4V2kX0zDqb9
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 23:24:39 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id f15so6816975plr.3
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 06:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iSjkRBZaZzqqyspTv5Rlok5FUwwdMWeo8V9Nhrb5sMs=;
 b=Iz9hMBHqOYMSUbVZjPNL5+8pzsnOnm5pJ/v0vQhJG8T1D0YDNs9UGeDDUcyUEWYiJ6
 075qC3JfRCrAQrNj9PYtQmrnPKvN753WI9DvauTRO/t2xdlhlSl4kYzPDGNmqou/lwbn
 ydc7rJCu/Q5mj92/s3m2z7u72kUcSCDRA5lC/hHG7EbBr/KO+9yhidB7TiC2zQ1ywKNM
 dhHWKPTj8quHl9R+5j1dKAe0Vmtb7znnnGRFnox95/Oif5/ZgCyFbj+rqOkjSLAnpqRT
 8JHWCv2JqDvZHpDWzBAphyJ4FuJvVofEVr1ziRiKQEXvFmumdpvGhvtcs7eDN5SlqE1V
 Z8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iSjkRBZaZzqqyspTv5Rlok5FUwwdMWeo8V9Nhrb5sMs=;
 b=cDHjsnBrfQIRUjnh3gXUYpAQbo5X3XXkytUrhm08X8TZvxM40/a9jsFZ4gO/w8vb3A
 Fyi6HSe8SDaT7fELd3qqgkT0YvqWRQIGM5xMCesRgmIo5PGPE/fQrFrT1AwroVSYu7yH
 vOziJJPUPQD/tcGvTtIHQcm7ykx6siw4VdMpQZYSdOS7GNFHicvKsv4sWGwVJKzfMlPN
 kIEfWZn2A/11bJEvh+NSF9c4hV052QDx/GdLmhj2RpleNn4ig32QO9Dfgj+I1eYV2wwB
 BwEM9gHmIdOukfGrNrbUkjX8F4pYH3ZAQFS4ZmthhVGdgIjK3lYl26uKJjVKxPyj05k+
 XEVw==
X-Gm-Message-State: AGi0PuYMwIOXV/KHznyXC6roiGlO1i60Vjv+QdYdypO2svEO6Qx3iG20
 oBK/7397Py+ycWuUvuTimW6yffrDYkuRu9/dOVE=
X-Google-Smtp-Source: APiQypKNQMV9FhaHSWOf7UxRN05vQ3HPYyxtuoRL7z6jDX5CsMcXQnKnLoX+3hhLB5LKBrp6nO8XIynSSifErzVVn+M=
X-Received: by 2002:a17:90a:8c8e:: with SMTP id
 b14mr28230204pjo.222.1589376276423; 
 Wed, 13 May 2020 06:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAMXw96Mnk8Hf4wAB_Ot=XEqp9yecspPfMGB6oF_LSgjRFMNHvw@mail.gmail.com>
 <CAB_SOc5tEo7xRg65aMfBOWyY_yXkb6+mLmRhf8hifNhHDWGVgQ@mail.gmail.com>
 <CAMXw96NoWn+sZELD1Xd=WUyLwvOUZ9prKyqqaLFKiMwM6ChuMw@mail.gmail.com>
 <CAB_SOc6pgn2OXd-KRYNpzszxWyhfGOdBTHMB5FWbat8QaZ1CoQ@mail.gmail.com>
 <CH2PR21MB1510B40F09178BC841F62AA6C8A50@CH2PR21MB1510.namprd21.prod.outlook.com>
 <CAB_SOc7dz7ARKH5W-d7EwrFnLxd0V3Ny7i3xyxGGGxHTGW0LOg@mail.gmail.com>
 <CH2PR21MB1510222BA2CC09AE1CC6AF90C8A10@CH2PR21MB1510.namprd21.prod.outlook.com>
 <CH2PR21MB1510A65080452245E6295DFDC8A10@CH2PR21MB1510.namprd21.prod.outlook.com>
In-Reply-To: <CH2PR21MB1510A65080452245E6295DFDC8A10@CH2PR21MB1510.namprd21.prod.outlook.com>
From: Zbyszek <zbigniewku@gmail.com>
Date: Wed, 13 May 2020 15:24:25 +0200
Message-ID: <CAB_SOc4c8UzMFM5YOtbrxJJkq08pbTs8ehWkcc=6ETycXdh=dw@mail.gmail.com>
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

Instruction is under review:
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/32234

pon., 11 maj 2020 o 20:57 Neeraj Ladkani <neladk@microsoft.com> napisa=C5=
=82(a):
>
>  "Oem": {
>         "OpenBMC": {
>             "@odata.type": "#OemAccountService.v1_0_0.AccountService",
>             "AuthMethods": {
>                 "BasicAuth": true,
>                 "Cookie": true,
>                 "SessionToken": true,
>                 "TLS": true,
>                 "XToken": true
>             }
>         }
>
> -----Original Message-----
> From: openbmc <openbmc-bounces+neladk=3Dmicrosoft.com@lists.ozlabs.org> O=
n Behalf Of Neeraj Ladkani
> Sent: Monday, May 11, 2020 11:20 AM
> To: Zbyszek <zbigniewku@gmail.com>
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>; Zhenfei Tai <ztai@google=
.com>
> Subject: RE: [EXTERNAL] Re: [bmcweb] mTLS client authentication always su=
cceeds
>
> I have enabled DBMCWEB_ENABLE_MUTUAL_TLS_AUTHENTICATION in bmcweb  but I =
do not see TLSAuth/Certificates in redfish/v1/AccountService ?  I tried to =
upload CA cert via bmcweb but I could not make it work ( Authentication fai=
ling)
>
> I could not find documentation to enable this feature. it would be great =
if someone can send steps to enable this feature?
>
> Neeraj
>
>
> -----Original Message-----
> From: Zbyszek <zbigniewku@gmail.com>
> Sent: Thursday, May 7, 2020 2:10 AM
> To: Neeraj Ladkani <neladk@microsoft.com>
> Cc: Zhenfei Tai <ztai@google.com>; OpenBMC Maillist <openbmc@lists.ozlabs=
.org>
> Subject: Re: [EXTERNAL] Re: [bmcweb] mTLS client authentication always su=
cceeds
>
> czw., 7 maj 2020 o 10:14 Neeraj Ladkani <neladk@microsoft.com> napisa=C5=
=82(a):
> >
> > Hi Zbyszek,
> >
> > Just a basic question, Once bmcweb is configured with -DBMCWEB_ENABLE_M=
UTUAL_TLS_AUTHENTICATION, can it work without client cert?
>
>
> Yes it can, by default all authentication methods are enabled except TLS.
> Which method is enabled can be checked via redfish service
> AccountService->Oem->OpenBMC->AuthMethods.
> To change these settings send PATCH to
> https://{{bmc_ip}}/redfish/v1/AccountService.
> For example to turn the tls use this patch body :  {"Oem": {"OpenBMC":
> {"AuthMethods": {"TLS": true}}}}
>
> I think this diagram at paragraph 'Authentication Process'
> https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2Fopenbmc%2Fdocs%2Fblob%2Fmaster%2Fdesigns%2Fredfish-tls-user-authent=
ication.md&amp;data=3D02%7C01%7Cneladk%40microsoft.com%7C35b75654ecce4c6800=
4508d7f5d81b8a%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637248180841865=
287&amp;sdata=3DOGH2hRGgB5%2FA%2FG63fiwp0hq2E%2FStoL1ka2ZPJ1zG1Tg%3D&amp;re=
served=3D0
> can be useful in understanding how the authentication process flow looks =
like.
> (now I see that some parts of this design, like paths requires updates, b=
ut the diagram is valid).
>
>
> >
> > It will be good to document curl APIs to enable this feature and test e=
nd to end flows.
> >
> > Thanks
> > Neeraj
> >
> > -----Original Message-----
> > From: openbmc <openbmc-bounces+neladk=3Dmicrosoft.com@lists.ozlabs.org>
> > On Behalf Of Zbyszek
> > Sent: Thursday, May 7, 2020 12:49 AM
> > To: Zhenfei Tai <ztai@google.com>
> > Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> > Subject: [EXTERNAL] Re: [bmcweb] mTLS client authentication always
> > succeeds
> >
> > =C5=9Br., 6 maj 2020 o 20:19 Zhenfei Tai <ztai@google.com> napisa=C5=82=
(a):
> > >
> > > Hi Zbyszek,
> > >
> > > Thanks for your reply. I look forward to the official documentation.
> > >
> > > The callback function returns true when preverified =3D=3D false. Not=
 sure why it should always return true, which accepts any client certificat=
e.
> >
> > Yes, always returning true we do not break the tls handshake allowing f=
or connection.
> > But user will not be authenticated anyway because its name will not be =
extracted from the certificate.
> > In such case user should receive proper http error code telling he is n=
ot authenticated.
> >
> > >
> > > // We always return true to allow full auth flow if (!preverified) {
> > > BMCWEB_LOG_DEBUG << this << " TLS preverification failed."; return
> > > true; }
> > >
> > > Thanks,
> > > Zhenfei
> > >
> > > On Wed, May 6, 2020 at 4:22 AM Zbyszek <zbigniewku@gmail.com> wrote:
> > >>
> > >> pt., 1 maj 2020 o 02:07 Zhenfei Tai <ztai@google.com> napisa=C5=82(a=
):
> > >> >
> > >> > Hi,
> > >> >
> > >> > I've been testing bmcweb mTLS for a while and found the user
> > >> > defined verify callback function returns true in all cases.
> > >> > (https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%
> > >> > 25
> > >> > 2F
> > >> > github.com%2Fopenbmc%2Fbmcweb%2Fblob%2Fmaster%2Fhttp%2Fhttp_conne
> > >> > ct
> > >> > ion.h%23L287&amp;data=3D02%7C01%7Cneladk%40microsoft.com%7C8f5ff61=
2
> > >> > 5e
> > >> > db4b734c3e08d7f25b2b68%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0
> > >> > %7
> > >> > C637244345695157575&amp;sdata=3D3E%2F%2FdxSuR5SFo9ZII%2FZAA7h6%2FD=
d
> > >> > s1
> > >> > lHeZaCnbimciLw%3D&amp;reserved=3D0)
> > >> >
> > >> > If client authentication is enabled in bmcweb, should it reject if=
 client certificate is bad?
> > >>
> > >> No, purpose of this callback is to only extract the user name from
> > >> the certificate and then allow to proceed with default OpenSSL
> > >> verification flow which should finally fail if something is wrong
> > >> with the certificate no matter what this function returned.
> > >> The 'set_verify_callback' doesn't replace the whole verification
> > >> procedure, it only adds a callback that is called when the default
> > >> validator checks each certificate. The 'preverified' parameter,
> > >> passed to it indicates if verification of the certificate succeeded =
or not.
> > >> You should be able to see it in bmcweb logs.
> > >>
> > >> >
> > >> > Thanks,
> > >> > Zhenfei
