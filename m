Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 126812E8F46
	for <lists+openbmc@lfdr.de>; Mon,  4 Jan 2021 02:52:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8JXP3xzCzDqYL
	for <lists+openbmc@lfdr.de>; Mon,  4 Jan 2021 12:52:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22f;
 helo=mail-oi1-x22f.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ppuX3RTs; dkim-atps=neutral
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8JWf475dzDqXq
 for <openbmc@lists.ozlabs.org>; Mon,  4 Jan 2021 12:51:20 +1100 (AEDT)
Received: by mail-oi1-x22f.google.com with SMTP id p5so30426169oif.7
 for <openbmc@lists.ozlabs.org>; Sun, 03 Jan 2021 17:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=VqbsP/Rld//mYKK8KH5LGtafTWMS5t2asEy2/bPihK8=;
 b=ppuX3RTsfQp1EKpKPNjmVtmxgxQqQtuW+zrRyuZIYoJ7Bj107hm/2kisNXA1tMVkvs
 TDFsruwQ+b1o/+ufBRIA1jqkFgZriORMfT9xbLh79JDfyt6VTzGNLX6bVUxaME2blc33
 Du4tcVVPiRObe+YbMh5dlfsq4Xb6R4ntUe9VZLx0cuAcjPpWvp0lSyfVRY7BWgCW5XtP
 t/sz2PwGlAXgBtnj1ipy0Njwgvft/2AFNc2gmElbonikyX5zqAVp7KKmngNTRcjVbOgO
 Dkd3FB96+RVn0XKomX21q7U9EDDk7k26I/KRZTsklmuJOvb1Brzl+VSUEF6CKSSefV5w
 iKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=VqbsP/Rld//mYKK8KH5LGtafTWMS5t2asEy2/bPihK8=;
 b=txeoFcPbpK362NsxpZmBThcluho7q4PuYD5RkEBEevf26Yp7vP3HGL6s/i2uJlygJB
 5LkUPmj7q4p24XYJcyhWZ/WbVOj8iDIT4XpOsh9EaGyr5PQQFp9x+ye+B0dcRIAaSq+u
 cOjD6ssHQtwfYey0DVDI/OlOgMbfXfgAaaWo3ZyFiQVQ3dyOEVQsqhg9L+3KUWhUbumO
 37BS2KZjOK311T/FNZDrHxN7bxODr/D8NQJHsyblyeNCg7JRzNTbs3CH/Wj6YcnM0RIi
 uATHC/SzCLOsNBG8bbKyaG6cO+W8QX9Q+W57rlVOSnUYk0SRflKj47Eowyc1z1Z0oDfu
 5ZQw==
X-Gm-Message-State: AOAM530AVbw4LioGrqSVuRahqfxhRogxhCzJdidKjSJrKSVW3dZqpKUP
 XSywifnFdOEQJnWayQdvvvYzzH+FW1Aw4g==
X-Google-Smtp-Source: ABdhPJyFzRxHSFD9SuIjwiCCXzE+f5oWNvpLF2Dzve4XrvnQWarDJVxzBPSwmiyBShftfFlxBJ75hg==
X-Received: by 2002:aca:ebd0:: with SMTP id
 j199mr16205505oih.155.1609725077199; 
 Sun, 03 Jan 2021 17:51:17 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:311a:9a2d:f156:c779])
 by smtp.gmail.com with ESMTPSA id a26sm11314855oos.46.2021.01.03.17.51.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 03 Jan 2021 17:51:16 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: Question about Redfish code update with multiple firmware
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <HK0PR04MB3058A9D9DBBDFA3C50EE82B3E6DE0@HK0PR04MB3058.apcprd04.prod.outlook.com>
Date: Sun, 3 Jan 2021 19:51:15 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <C9B05DCE-97C3-4F52-BBF6-5AAC13B7A40E@gmail.com>
References: <HK0PR04MB3058A9D9DBBDFA3C50EE82B3E6DE0@HK0PR04MB3058.apcprd04.prod.outlook.com>
To: =?utf-8?B?IlRvbnkgTGVlICjmnY7mloflr4wpIg==?= <Tony.Lee@quantatw.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Dec 23, 2020, at 3:54 AM, Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) =
<Tony.Lee@quantatw.com> wrote:
>=20
> Hi Andrew,
>=20
> I did the Redfish code update with multiple firmware at my =
environment.
> Steps as follows:
>=20
> There are two different image A and B.=20
>=20
> curl -k -H "X-Auth-Token: $bmc_token" -H "Content-Type: =
application/octet-stream" -X POST -T <imageA> =
https://${bmc}/redfish/v1/UpdateService
>=20
> curl -k -H "X-Auth-Token: $bmc_token" -X GET =
https://${bmc}/redfish/v1/UpdateService/FirmwareInventory
> {
>  "@odata.id": "/redfish/v1/UpdateService/FirmwareInventory",
>  "@odata.type": =
"#SoftwareInventoryCollection.SoftwareInventoryCollection",
>  "Members": [
>    {
>      "@odata.id": =
"/redfish/v1/UpdateService/FirmwareInventory/5805e80e"
>    }
>  ],
>  "Members@odata.count": 1,
>  "Name": "Software Inventory Collection"
> }
>=20
> curl -k -H "X-Auth-Token: $bmc_token" -H "Content-Type: =
application/octet-stream" -X POST -T <imageB> =
https://${bmc}/redfish/v1/UpdateService
>=20
> curl -k -H "X-Auth-Token: $bmc_token" X GET =
https://${bmc}/redfish/v1/UpdateService/FirmwareInventory
> {
>  "@odata.id": "/redfish/v1/UpdateService/FirmwareInventory",
>  "@odata.type": =
"#SoftwareInventoryCollection.SoftwareInventoryCollection",
>  "Members": [
>    {
>      "@odata.id": =
"/redfish/v1/UpdateService/FirmwareInventory/dce3bf32"
>    }
>  ],
>  "Members@odata.count": 1,
>  "Name": "Software Inventory Collection"
> }
>=20
> You can tell that first image will be replaced by the second one.
> Does it match the situation described in the "Delete an Image" section =
of firmware-update-over-redfish.md?
> What is the expected behavior when doing Redfish code update with =
multiple firmware?

Hi Tony, the behavior is system specific. On our IBM systems we provide =
a redundant
flash chip (or section of an emmc chip). My understanding of the BMC =
update firmware
is it will write the other section if present otherwise it will =
overwrite the existing image.

https://github.com/openbmc/docs/tree/master/architecture/code-update (or =
Adriana)
may have some more info on redundancy support.

https://github.com/ibm-openbmc/dev/issues/794 has some links and info on =
our
bmcweb/Redfish support for the other image when the system supports it.

Andrew


>=20
> Thanks
> Best Regards,
> Tony
>=20

