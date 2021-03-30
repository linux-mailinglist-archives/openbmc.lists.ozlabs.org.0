Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F5334E0D2
	for <lists+openbmc@lfdr.de>; Tue, 30 Mar 2021 07:47:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8dl15HBBz304Y
	for <lists+openbmc@lfdr.de>; Tue, 30 Mar 2021 16:47:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-nuvoton-onmicrosoft-com header.b=u07p/kqD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=apc01-sg2-obe.outbound.protection.outlook.com
 (client-ip=2a01:111:f400:febd::62d;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=chli30@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-nuvoton-onmicrosoft-com header.b=u07p/kqD; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sg2apc01on062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febd::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8dkl3x9Gz2yxr
 for <openbmc@lists.ozlabs.org>; Tue, 30 Mar 2021 16:47:25 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E1LkZAuPyV19yjLC6eIFua2noS2s+2tHI1A7jmkKGQMmekG5ITTlGLCda3St7JAFoVYU7xx/0SH6Qzuq0IpHJG3mgIA6bOTIyXwK8q/kU5pVGoP6rmyQYo+T8BTU0WutD1eGOwfORDO2jirint1gX8yGgqF4Eea0C1tqTTpCsKByeXDirgqHyPPr/ZR3lpdGPTyxIqAwvOjo9L9GqvrCzHXzVc4G7IAfsnNZJnuL+z/c9EfGrIT5Z80m+TtfH8OG8ho1j/BbbGiV70qsx1rDrno6H1mDZo3+gdal2VHjQEhYcDHAiQtYbx14xQAhI43dSIhXIr6vkZvLvkthccbgmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+9OAntES7VsSsI7r4XR2LoJObYnMcTpI5MjpI4F28w=;
 b=H0UY603kZHiKOl07IsmCzd4L1WuGx1Zj4Uvhg7UNfSkbVSuQJYXC+f9daqfHlzYZUYJdQ/nCJv+NZO8OOsVkQFUJEuyMWSio0LBRCKDr37XJ3+j4rARfHEjo1PMRKz0uWO4OhNN0UusifWnsOBxXsS0Ekkk+2K4GFvC9kABSnX6d90Ut32KBbTJvnYGqwZJkUs+FAJqC83mS0pbNN2qnYp6ThEFd/LaK0Wi1/xn3kKZ09cam1ZyojOsqALPKSk1ZVzchVDHVGNvdUzSevJ7kTRU/oH5LW9aLH83a48ie81UbFfmZbBILlmNqlM08KJBFl7NaqDzslu6VtIu2/kKu2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+9OAntES7VsSsI7r4XR2LoJObYnMcTpI5MjpI4F28w=;
 b=u07p/kqDrvVbwPdtdG+nvbXVzfUYmkJoQOTvT4g7xg/E+MhMrJtoiegiiB1nA/qd368KKRdlzBQi7SR0Y7r+Y7jbo5QOLoGRAdCRzn0DwD2Ndc+9xKs9XP2NLqy3GauqqQa0ugpiTnKiLVU64gnmUQFblqika0+cXweBnHGK5YE=
Received: from PS1PR03MB5100.apcprd03.prod.outlook.com (2603:1096:300:7e::10)
 by PU1PR03MB2889.apcprd03.prod.outlook.com (2603:1096:803:1f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.14; Tue, 30 Mar
 2021 05:47:08 +0000
Received: from PS1PR03MB5100.apcprd03.prod.outlook.com
 ([fe80::78ca:558:dfc0:f101]) by PS1PR03MB5100.apcprd03.prod.outlook.com
 ([fe80::78ca:558:dfc0:f101%7]) with mapi id 15.20.3999.025; Tue, 30 Mar 2021
 05:47:08 +0000
From: CS20 CHLi30 <CHLI30@nuvoton.com>
To: Lei Yu <yulei.sh@bytedance.com>, CS20 CHLi30 <CHLI30@nuvoton.com>
Subject: RE: [OpenBMC] [Linux-5.10] useradd: cannot open /etc/passwd
Thread-Topic: [OpenBMC] [Linux-5.10] useradd: cannot open /etc/passwd
Thread-Index: AdckYUdVvnoSdGPcThuquxaeQmoqIAAqg4oAAAFymlA=
Date: Tue, 30 Mar 2021 05:47:08 +0000
Message-ID: <PS1PR03MB51000EC29C060029981CE8B6CF7D9@PS1PR03MB5100.apcprd03.prod.outlook.com>
References: <HK0PR03MB5090B60085F8D0C40B0D9496CF7E9@HK0PR03MB5090.apcprd03.prod.outlook.com>
 <CAGm54UE+zUQHXiLONCVUZRuxOJVC8Mhkxo-A5DZtb+t56oiHhg@mail.gmail.com>
In-Reply-To: <CAGm54UE+zUQHXiLONCVUZRuxOJVC8Mhkxo-A5DZtb+t56oiHhg@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bytedance.com; dkim=none (message not signed)
 header.d=none;bytedance.com; dmarc=none action=none header.from=nuvoton.com;
x-originating-ip: [60.250.194.160]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eec69ce9-6a97-4a06-b930-08d8f33f41e5
x-ms-traffictypediagnostic: PU1PR03MB2889:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PU1PR03MB28898F005EFFD7E2D3760643CF7D9@PU1PR03MB2889.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xZnwoIupcBQrLOWIhCANeclpUQBGv5Yo8ZmNquKsTqszQMUHG6FRLWwbWOWdPweiP35cT1DUGR7L1rgL+TbPWt0yQe2wLxUMyPQzm2c/9gSqVyVr0WvmcT2jKTiot6DiV95YIdc0qtNavUWEmniYIs4igJEJAxZTTTXJ7m7P8/aJim//ZWxn9jVOt6ZeA1EvMdF/nMSh2aJ7/NFeaJXk0/kLOjbUrw11zBLiypqxayyiTjRk6bvqDLDuiCt5M/Q/zawbGqMXQu96aVamhrHPTIHZpKwUQ3ZnjjA6gvVTCaL53oFVRqNzHdY06rHGCUexVuuc0WSuqoQaLTGpN6qTSnUSavTezlNocnR2gVw+/0mZNi/66XKnh5yuL+fzzuwsVvE6Avs9BDcTb3sBUzs8NIQZXr1aQwat0PphyS7C8hs+X5gXQJBETK0Nq9qlihqP9O1tTNyi8c9nlYOjEJcC/d4OAW0g+FV588rFRYpH+XKmgQczd0OYKsp2z756Xchzb/Q56hxLV9X+OO4je9QIfLnh4qCFUPRXw1LxwL1c6tdZo+DZzoTj/xTCLkwS1QH/gG9uweoXUYDGIDWwuoAQ6xkrNEMaFcxr579ybm3Gdgt9DXukhK5yg8NUj7EzL+GYCys6lDXK4mrjBRpT6WcFRqyadHLVc2rrRkNXjpW98TYuB4DtRaUPxcaKifCUfds6OsVZKSN2qtd/1yZ0mK5J19WYV3EmR0tawcFtBcErUKfyX8km94VHDzmZP5jQv6EX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PS1PR03MB5100.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(83380400001)(38100700001)(71200400001)(4326008)(478600001)(966005)(8676002)(33656002)(53546011)(8936002)(6506007)(7696005)(26005)(55016002)(5660300002)(9686003)(66446008)(76116006)(64756008)(66476007)(66946007)(186003)(66556008)(86362001)(2906002)(110136005)(316002)(52536014)(45080400002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?FYoNd5WfkcO7bzPJ0H2YCXCH/rcg+OiSvdl5aufq4TTkKz9xFuWi1GqCIssT?=
 =?us-ascii?Q?xqcBU7UA6xCZ6yzb13pGjOHhCU6RSpTtzPu3Q8DtH0dXQD9DPME5uSdGNUM4?=
 =?us-ascii?Q?iypyHUhoIMOCPiTZdrUivU91S+XlRNyQHOKeZ6DfYvi0cTHvlrh/bSxftKIG?=
 =?us-ascii?Q?MO/za+foWXyOFup3hqSCrSMGwAoLa3kxvtT/bA4IB9XR3PNEGHy/tda7GsJu?=
 =?us-ascii?Q?2ub7zFcmQiVjm69xvfgiMr5sq3aw3Va6Xqpusue+s0p4FJqIpFR1pz640XK7?=
 =?us-ascii?Q?YoEpwBBLP6zZflm829upiUFbCRKRIotskJ4OWOeVF+XadgjXVp2s9Uyldnxw?=
 =?us-ascii?Q?d8yTTHfe+rEAOalarOaSHW+SBnsXTqpslpc8vV7zzT82rTuWrqNvidnO0gA1?=
 =?us-ascii?Q?oEckDV/AD97N7lRZ658JEnpz/HBfkUN9y74cwBkTkcW/kj9gKXmFcaKQT4HD?=
 =?us-ascii?Q?OVpmVGxg9uQ8ZMmu6AN64Fg7f9SJyXeDCjs9SiM7mvjQEiiiVRZtHua+TsSw?=
 =?us-ascii?Q?RrrBqaiPE/XodNK8GPIFpHsHlBF6rEnAOoxIeuvbCvZxikeJnUY+0iiZxwht?=
 =?us-ascii?Q?ZGBK2rgaTclE50m1XEGCKu+p+M52w20hEzXF8PVDCQW8c2uCK5nv0W5wKAYv?=
 =?us-ascii?Q?1TQNUBrGyoKfOroIrrh+rwuz6jlHfh0z3sby0IFMZW301Q+EsFibC7XskKsT?=
 =?us-ascii?Q?vFXD9K21YqPZ6wv3xCmQ7f/GBfH5+dxdVIFX/qmqG3Nex/l5yYExZBKipfIu?=
 =?us-ascii?Q?mn7Pi/e2191R1X3R+Ns62hCjPsr0rgsgHvplEtOijL99rzsXwywRDr6zGlh6?=
 =?us-ascii?Q?Q5sCWKsbTpX7CpaJH21KPBIBElUhq3qRc4zYIqkalDL2GQHk3kX5nqppJUta?=
 =?us-ascii?Q?PO6I+cxnW4NkMsT0YL1hBn5XbFtlj74N6MTkAuJNiQNX26tnc+c2JGwmaXoc?=
 =?us-ascii?Q?Onr42pPvl0fbcv5yavmTsd3VmfotDK9P/SYsph7bVY2OrVxaUnC2poBpkgdI?=
 =?us-ascii?Q?8N6Vl8nugHb6AayrW1cWOSrVfkLoM0F4LdfuPxTWqAo6mNDoZlr3i2MROsai?=
 =?us-ascii?Q?TweCDQKprSiyN4bdqMp4/vv0BJ9GbudeCvafsteCt/c9UCNF0lGoOyETkRN7?=
 =?us-ascii?Q?+D6x4tHcP2/F5v0cpHeP7Z0FszoaXCtf1XI3b8MHDF9F5fLgdFTyvN+nwi01?=
 =?us-ascii?Q?fIxMVabAKkD/16kcGNhNMM1CHTKWgVqO5THbDqzYE43fV1a50/0xoSbYg+xA?=
 =?us-ascii?Q?RT5LGt3a5SzRUJVU5+n3IZ0K5KsgGDkaLJWDq8JLkwnlsiQrX9GW6vuJxkED?=
 =?us-ascii?Q?+SpRD6Ysr+MyBlan3WFpjc1p?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS1PR03MB5100.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eec69ce9-6a97-4a06-b930-08d8f33f41e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2021 05:47:08.6069 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w7P/m36agHLaf7O63Lgxaa6+XYCmM7xBPcndEjshJeR1I8M8aWl3+qki+Smqol5utal3ylnswgeSSXxMDMbw5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1PR03MB2889
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Lei Yu,

Thanks your help to provide this information.
This issue seems relate to "cannot do write action for /etc/passwd file".
I'm trying to check whether is relate to jffs2 or overlayfs filesystem driv=
er.
If you have any suggestion or finding, please let me know, thank you very m=
uch. BTW, I cannot see any discussion on [discord][1], is it open?

open action for /etc/passwd file without problem, but when doing "touch" or=
 "useradd" this kind of writing action then got issue symptom.
Thus, this issue's root cause should not relate to "utimensat_time64()" fun=
ction.
Due to "useradd" got same fail symptom, but it's not call this function acc=
ording the result about strace.
Below are strace result on kernel 5.4 and 5.10 for you refer it. Both are u=
sing the same version useradd daemon to test it.

Kernel 5.10:
root@olympus-nuvoton:/# strace useradd timlee
openat(AT_FDCWD, "/etc/passwd", O_RDWR|O_NOCTTY|O_NONBLOCK|O_LARGEFILE|O_NO=
FOLLOW) =3D -1 EINVAL (Invalid argument)
write(2, "useradd: cannot open /etc/passwd"..., 33useradd: cannot open /etc=
/passwd
) =3D 33

Kernel 5.4:
root@olympus-nuvoton:/# strace useradd timlee
openat(AT_FDCWD, "/etc/passwd", O_RDWR|O_NOCTTY|O_NONBLOCK|O_LARGEFILE|O_NO=
FOLLOW) =3D 4

Best regards,
Tim

-----Original Message-----
From: Lei Yu [mailto:yulei.sh@bytedance.com]
Sent: Tuesday, March 30, 2021 10:21 AM
To: CS20 CHLi30 <CHLI30@nuvoton.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [OpenBMC] [Linux-5.10] useradd: cannot open /etc/passwd

As discussed in [discord][1], a similar issue could be simply reproduced by=
:
`touch /etc/passwd`, that gives `Invalid argument`.

With strace, the error is from `utimensat_time64()`

    # ./strace touch /etc/passwd
    execve("/bin/touch", ["touch", "/etc/passwd"], 0x7eef7dd4 /* 16 vars */=
) =3D 0
    ......
    getuid32()                              =3D 0
    utimensat_time64(AT_FDCWD, "/etc/passwd", NULL, 0) =3D -1 EINVAL (Inval=
id argument)
    write(2, "touch: /etc/passwd: Invalid argu"..., 37touch:
/etc/passwd: Invalid argument
    ) =3D 37
    exit_group(1)

[1]: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fdi=
scord.com%2Fchannels%2F775381525260664832%2F775694683589574659%2F8260659675=
82281768&amp;data=3D04%7C01%7CCHLI30%40nuvoton.com%7C09540457f4be483dc75108=
d8f3227ffd%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C637526676785951652%=
7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWw=
iLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DJu0bjtNK%2BAVlMVtFILficzZhK6%2BC74AiVujO=
%2FvbjCyE%3D&amp;reserved=3D0

On Mon, Mar 29, 2021 at 2:18 PM CS20 CHLi30 <CHLI30@nuvoton.com> wrote:
>
> Hi All,
>
>
>
> We met this issue symptom after upgrading Linux kernel to 5.10.xx.
>
> However, we didn't meet this issue at kernel 5.4 and 5.8.
>
>
>
> And, we had run QEMU with latest palmetto 5.10.23 image, issue symptom al=
so can be repo it.
>
> Is there anyone meet this issue at Linux kernel 5.10.xx? From journal log=
, we didn't find any obvious log about this symptom.
>
> This issue is easy to repo and 100%, you can follow below repo step on yo=
ur OpenBMC project to repo it. Thanks.
>
>
>
> Symptom:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D
>
> Ipmi.Test Ipmi User :: Test suite for OpenBMC IPMI user management.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D
>
> Verify IPMI User Summary :: Verify IPMI maximum supported IPMI use...
>
> | FAIL |
>
> Set User Name command failed (user 9, name HgekZnCI): Unspecified
> error: 1 !=3D 0
>
>
>
> Journal Log:
>
> olympus-nuvoton kernel: Linux version 5.10.14-711b69d-dirty-08f25ae
> (oe-user@oe-host)
>
> Mar 18 14:42:26 olympus-nuvoton phosphor-user-manager[1409]: useradd:
> cannot open /etc/passwd
>
> Mar 18 14:42:26 olympus-nuvoton useradd[1409]: failed adding user
> 'HgekZnCI', data deleted
>
> Mar 18 14:42:26 olympus-nuvoton phosphor-user-manager[288]: The operation=
 failed internally.
>
> Mar 18 14:42:26 olympus-nuvoton phosphor-user-manager[288]: Unable to
> create new user
>
> Mar 18 14:42:26 olympus-nuvoton phosphor-user-manager[288]: The operation=
 failed internally.
>
>
>
> How to repo:
>
> 1. Run robot -t Verify_IPMI_User_Summary ipmi/test_ipmi_user.robot or
>
> 2. Execute useradd command to add user in our Olympus-nuvoton runbmc devi=
ce.
>
>   root@olympus-nuvoton:/# useradd timlee
>
>   useradd: cannot open /etc/passwd
>
>
>
> QEMU for plametto test result:
>
> root@palmetto:~# cat /proc/version
>
> Linux version 5.10.23-6687842 (oe-user@oe-host)
> (arm-openbmc-linux-gnueabi-gcc (GCC) 10.2.0, GNU ld (GNU Binutils)
> 2.36.1.20210209) #1 Sun Mar 28 20:54:20 UTC 2021
>
> root@palmetto:~# useradd timlee
>
> useradd: cannot open /etc/passwd
>
>
>
> Debug:
>
> We had added more debug log in overlayfs driver, but seems all overlayfs =
function call normally without error code return.
>
> Here is the part of log after executing useradd command.
>
>
>
> root@olympus-nuvoton:/# useradd timlee66
>
> Mar 24 05:21:41 olympus-nuvoton kernel: overlayfs:
> open(a6b0076c[sbin/useradd/l], 0400040) -> (581ac127, 0401400040)
>
> Mar 24 05:21:46 olympus-nuvoton kernel: overlayfs:
> open(c2f826cb[etc/nsswitch.conf/l], 00) -> (f971c00e, 0401000000)
>
> Mar 24 05:21:46 olympus-nuvoton kernel: overlayfs:
> open(6fc219b2[etc/ld.so.cache/l], 0400000) -> (0d21569c, 0401400000)
>
> Mar 24 05:21:46 olympus-nuvoton kernel: overlayfs:
> open(48a47202[lib/libnss_files-2.32.so/l], 0400000) -> (ee6b0bfe,
> 0401400000)
>
> Mar 24 05:21:46 olympus-nuvoton kernel: overlayfs:
> open(3c1f263f[etc/passwd/l], 00) -> (b7939c0b, 0401000000)
>
> Mar 24 05:21:46 olympus-nuvoton kernel: overlayfs:
> open(176fd21b[etc/ld.so.cache/l], 0400000) -> (d2e6be78, 0401400000)
>
> Mar 24 05:21:46 olympus-nuvoton kernel: overlayfs:
> open(607e8d70[lib/libnss_ldap.so.2/l], 0400000) -> (57f4f2f1,
> 0401400000)
>
> Mar 24 05:21:52 olympus-nuvoton kernel: overlayfs:
> create(etc/passwd.985, 0100600) =3D 0
>
> Mar 24 05:21:52 olympus-nuvoton kernel: overlayfs:
> open(c46e5b8b[etc/passwd.985/u], 0400001) -> (ef6449e9, 0401400001)
>
> Mar 24 05:21:52 olympus-nuvoton kernel: overlayfs:
> link(etc/passwd.985, etc/passwd.lock) =3D 0
>
> Mar 24 05:21:52 olympus-nuvoton kernel: overlayfs: create(work/#1b,
> 0100000) =3D 0
>
> Mar 24 05:21:52 olympus-nuvoton kernel: overlayfs: unlink(work/#1b) =3D
> 0
>
> Mar 24 05:21:52 olympus-nuvoton useradd[985]: failed adding user
> 'timlee', data deleted
>
> useradd: cannot open /etc/passwd
>
>
>
> Best regards,
>
> Tim
>
> ________________________________
> The privileged confidential information contained in this email is intend=
ed for use only by the addressees as indicated by the original sender of th=
is email. If you are not the addressee indicated in this email or are not r=
esponsible for delivery of the email to such a person, please kindly reply =
to the sender indicating this fact and delete all copies of it from your co=
mputer and network server immediately. Your cooperation is highly appreciat=
ed. It is advised that any unauthorized use of confidential information of =
Nuvoton is strictly prohibited; and any information in this email irrelevan=
t to the official business of Nuvoton shall be deemed as neither given nor =
endorsed by Nuvoton.



--
BRs,
Lei YU
________________________________
________________________________
 The privileged confidential information contained in this email is intende=
d for use only by the addressees as indicated by the original sender of thi=
s email. If you are not the addressee indicated in this email or are not re=
sponsible for delivery of the email to such a person, please kindly reply t=
o the sender indicating this fact and delete all copies of it from your com=
puter and network server immediately. Your cooperation is highly appreciate=
d. It is advised that any unauthorized use of confidential information of N=
uvoton is strictly prohibited; and any information in this email irrelevant=
 to the official business of Nuvoton shall be deemed as neither given nor e=
ndorsed by Nuvoton.
