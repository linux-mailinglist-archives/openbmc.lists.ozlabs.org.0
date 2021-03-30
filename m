Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE1534DE35
	for <lists+openbmc@lfdr.de>; Tue, 30 Mar 2021 04:21:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8Y971Zmqz302T
	for <lists+openbmc@lfdr.de>; Tue, 30 Mar 2021 13:21:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=SBhljTkO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::336;
 helo=mail-ot1-x336.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=SBhljTkO; dkim-atps=neutral
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8Y8v6yf9z300L
 for <openbmc@lists.ozlabs.org>; Tue, 30 Mar 2021 13:21:18 +1100 (AEDT)
Received: by mail-ot1-x336.google.com with SMTP id
 91-20020a9d08640000b0290237d9c40382so14171566oty.12
 for <openbmc@lists.ozlabs.org>; Mon, 29 Mar 2021 19:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5Sn+6oXkuwP4GDC9qYFKzCepaONF1fnM61+SRiMZeuk=;
 b=SBhljTkOJ/kZHWXPrP4Y3e2vP7DbpsyDkYTIx7UVb9anFOWFmWtbc1Y8QvUWsqCl+A
 K1wV1CF16/FLWzrOXsrhM85LFG39xoh+nL2MEG2pkjf0K5xDONXdfJ36QyCEhFdp7NjZ
 rqJHcPlf7rf4GnKffa7DKY4829B+NhpD94CLRz9UWb/Sp8orevvQEgJVXOxdn1awJ597
 adJjUBLjuKJB8reUEIB2RABLiyQ4JXJ6GW7msJj/Wosmi6+ocEruf1qMuHVJnerox1f6
 mQX4CU+wZTm89+LdzToUd3OrZn0U7ODQs+2nl74uUHasNPMz/BoYAab1HeFh38rwWvto
 J3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5Sn+6oXkuwP4GDC9qYFKzCepaONF1fnM61+SRiMZeuk=;
 b=f07m7R/hZZwjlJm816aO/+Lzvp4GRKFBTcWIxmOZKlEZcbHKj2PKHgUPWQIcn1XaeX
 CI6B9g71199SeP9QvLQMzeVB7z8qJKN9xP6g5VjmrG6K5vLWbeUyzRX9yscGn8LQUzmj
 mirD6UP7oieSNB7c3fkfRQERgAxxbdMi19Odu4KkN9C5cI0nzHrGpsWGubmRP0M2Rnh7
 xlr6ovy2FZ5z56XSvl0ZDYToLOMdTQydm5f7N8gn1wCr7HUFULfGYFiCEp7nkxjGoCWt
 JeZrLmAX8Ph/JJLUB7hYeA5lKioklWpPmYOkYJX7zPWeAgpcvvSjIn8A8AEjBeuTjVHC
 zcTA==
X-Gm-Message-State: AOAM5335zUaoDZG+WbgBFDiW0xkoVMDaFGesMYMMJzPf0vVxGbik4451
 HNjTuD96IeE4+TWD0FGy5qXVzACkhkPuq/e2+A+TMfndi1tT8A==
X-Google-Smtp-Source: ABdhPJwCnHIye9nOwbLxzMxRIqjMaXZ98nb9mc1ClUXcNzl0jnqJzKqoWgsM8o3bDbR88f6fHGiu5u8Zl/Z8sKTiY1M=
X-Received: by 2002:a9d:5f15:: with SMTP id f21mr24054054oti.226.1617070875072; 
 Mon, 29 Mar 2021 19:21:15 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR03MB5090B60085F8D0C40B0D9496CF7E9@HK0PR03MB5090.apcprd03.prod.outlook.com>
In-Reply-To: <HK0PR03MB5090B60085F8D0C40B0D9496CF7E9@HK0PR03MB5090.apcprd03.prod.outlook.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Tue, 30 Mar 2021 10:21:04 +0800
Message-ID: <CAGm54UE+zUQHXiLONCVUZRuxOJVC8Mhkxo-A5DZtb+t56oiHhg@mail.gmail.com>
Subject: Re: [OpenBMC] [Linux-5.10] useradd: cannot open /etc/passwd
To: CS20 CHLi30 <CHLI30@nuvoton.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

As discussed in [discord][1], a similar issue could be simply reproduced by=
:
`touch /etc/passwd`, that gives `Invalid argument`.

With strace, the error is from `utimensat_time64()`

    # ./strace touch /etc/passwd
    execve("/bin/touch", ["touch", "/etc/passwd"], 0x7eef7dd4 /* 16 vars */=
) =3D 0
    ......
    getuid32()                              =3D 0
    utimensat_time64(AT_FDCWD, "/etc/passwd", NULL, 0) =3D -1 EINVAL
(Invalid argument)
    write(2, "touch: /etc/passwd: Invalid argu"..., 37touch:
/etc/passwd: Invalid argument
    ) =3D 37
    exit_group(1)

[1]: https://discord.com/channels/775381525260664832/775694683589574659/826=
065967582281768

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
, we didn=E2=80=99t find any obvious log about this symptom.
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
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>
> Ipmi.Test Ipmi User :: Test suite for OpenBMC IPMI user management.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>
> Verify IPMI User Summary :: Verify IPMI maximum supported IPMI use...
>
> | FAIL |
>
> Set User Name command failed (user 9, name HgekZnCI): Unspecified error: =
1 !=3D 0
>
>
>
> Journal Log:
>
> olympus-nuvoton kernel: Linux version 5.10.14-711b69d-dirty-08f25ae (oe-u=
ser@oe-host)
>
> Mar 18 14:42:26 olympus-nuvoton phosphor-user-manager[1409]: useradd: can=
not open /etc/passwd
>
> Mar 18 14:42:26 olympus-nuvoton useradd[1409]: failed adding user 'HgekZn=
CI', data deleted
>
> Mar 18 14:42:26 olympus-nuvoton phosphor-user-manager[288]: The operation=
 failed internally.
>
> Mar 18 14:42:26 olympus-nuvoton phosphor-user-manager[288]: Unable to cre=
ate new user
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
> Linux version 5.10.23-6687842 (oe-user@oe-host) (arm-openbmc-linux-gnueab=
i-gcc (GCC) 10.2.0, GNU ld (GNU Binutils) 2.36.1.20210209) #1 Sun Mar 28 20=
:54:20 UTC 2021
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
> Mar 24 05:21:41 olympus-nuvoton kernel: overlayfs: open(a6b0076c[sbin/use=
radd/l], 0400040) -> (581ac127, 0401400040)
>
> Mar 24 05:21:46 olympus-nuvoton kernel: overlayfs: open(c2f826cb[etc/nssw=
itch.conf/l], 00) -> (f971c00e, 0401000000)
>
> Mar 24 05:21:46 olympus-nuvoton kernel: overlayfs: open(6fc219b2[etc/ld.s=
o.cache/l], 0400000) -> (0d21569c, 0401400000)
>
> Mar 24 05:21:46 olympus-nuvoton kernel: overlayfs: open(48a47202[lib/libn=
ss_files-2.32.so/l], 0400000) -> (ee6b0bfe, 0401400000)
>
> Mar 24 05:21:46 olympus-nuvoton kernel: overlayfs: open(3c1f263f[etc/pass=
wd/l], 00) -> (b7939c0b, 0401000000)
>
> Mar 24 05:21:46 olympus-nuvoton kernel: overlayfs: open(176fd21b[etc/ld.s=
o.cache/l], 0400000) -> (d2e6be78, 0401400000)
>
> Mar 24 05:21:46 olympus-nuvoton kernel: overlayfs: open(607e8d70[lib/libn=
ss_ldap.so.2/l], 0400000) -> (57f4f2f1, 0401400000)
>
> Mar 24 05:21:52 olympus-nuvoton kernel: overlayfs: create(etc/passwd.985,=
 0100600) =3D 0
>
> Mar 24 05:21:52 olympus-nuvoton kernel: overlayfs: open(c46e5b8b[etc/pass=
wd.985/u], 0400001) -> (ef6449e9, 0401400001)
>
> Mar 24 05:21:52 olympus-nuvoton kernel: overlayfs: link(etc/passwd.985, e=
tc/passwd.lock) =3D 0
>
> Mar 24 05:21:52 olympus-nuvoton kernel: overlayfs: create(work/#1b, 01000=
00) =3D 0
>
> Mar 24 05:21:52 olympus-nuvoton kernel: overlayfs: unlink(work/#1b) =3D 0
>
> Mar 24 05:21:52 olympus-nuvoton useradd[985]: failed adding user 'timlee'=
, data deleted
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



--=20
BRs,
Lei YU
