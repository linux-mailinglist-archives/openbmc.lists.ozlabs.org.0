Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2670CA5A883
	for <lists+openbmc@lfdr.de>; Mon, 10 Mar 2025 23:42:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBX2d2v0Nz3cjX
	for <lists+openbmc@lfdr.de>; Tue, 11 Mar 2025 09:42:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741342811;
	cv=none; b=ML7gBEXTlVMpTZcY+AvDxa41oiVKedLXFdmuC8jhmjzsMLINigjULkBQFPj63ZL1VvX3FZQeqMfd5BuBjQztX9yQp8Up78lzgkxY2m4NM3JynVrw/ZeKlk+IyVva4CWXKJ4s+YYUm9TdopTgtTteu4+lb2hfB7vnlLubqkcRQ+IfLE4eZO8KpY0IK5UX+ZjHZteuz4RTg2YEcA5OOV30tl4GOk2rjetKcPLzazVh8Lh4JUEzXVLwKT2Hfn+EyyFJaD2dNsK3INCMSo17mFzIyes7SxnsfXWjquMyc3IAi/kcHDpp2YxU8kixE4zMPv3W4EY4tO3xW74agXeQHwlj6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741342811; c=relaxed/relaxed;
	bh=/OGwSVTIyEeCeFtTcunoCij0GhR2d85eeOTrBM98k2o=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=jQmKX1kRvIQmYtoZF14HVRy695XdONLjY7YQb+G5a/HbnukKIJzrRLYWIAcsRhjGv2iVYpKtfOJUwDHXGZyh2P6a+kt0NbpQeCsm5JitSDyZeqnInAv4RFrM642z7KIzaIZIKMlnzR8pTO43TQBhpo+L0n9wEGEl6G+vNNxCmrKYKgQeGgZEDIA65JPJiqRXWyVO7zPaF13YLVT0EgNOsbNBe3BuqFE7YqBTsn+Uu8auy715VFiQO39G3le0kNcsvyRpJ6jTsgZfxy1WkURchypu5pFZuhjcxkKhPRNaO3RHFJN7get+f9lqcYzfLAUHMYFfejmf/CfcZG4sdDA2bQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jWHRUciR; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=dhlee0414@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jWHRUciR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=dhlee0414@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z8Mjj1y1Fz3c9R
	for <openbmc@lists.ozlabs.org>; Fri,  7 Mar 2025 21:20:09 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2fe9759e5c1so2573263a91.0
        for <openbmc@lists.ozlabs.org>; Fri, 07 Mar 2025 02:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741342806; x=1741947606; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/OGwSVTIyEeCeFtTcunoCij0GhR2d85eeOTrBM98k2o=;
        b=jWHRUciRiL83XU1joP/Mm3VsqaEf+jEVT3gEv9HlTD3vyLm9kEcc4tqA+eAk0otJoR
         vxTUB5+wkm53UuVjRsK4nxC0xCCdUwcjNQXb7Eqb+6Yf1aopMxuSqHcHtDB4PbhICUgR
         GPkD726idqu0mClVAv4jWpcwRMvKcy3i2rtPZQ5wbcyOSr9IwMfw0Ac+kbu5UXVCk1RE
         kQV4kS/SqQLUSwORVXVV2yxuS2gb6QrZDPJAfxoNzbLRaIZhb/3gW7KJ97mgNeKmg8XF
         4GU7RVYDJ6JU6UrLEZ3xjZs0c0aW/2go36b1+2GDNw7VqTBcPJSBlFAjLVh2bGt3VpdW
         VnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741342806; x=1741947606;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/OGwSVTIyEeCeFtTcunoCij0GhR2d85eeOTrBM98k2o=;
        b=k56V6kbWy5f54vpZtA5vKtq6ltL6R65ro0uZBbeguTEUmL3zwF5wnQO2PRNnRy8AHL
         sBTCyKjt5sai7WmRTlsPaz+g3r/M1n44PFk33HKO6Hg6KCoWocPBI5MlllMgPnDDx4wG
         CYmHVUQ498+Nn+FydaNUd0ryopAajsvvXPncvfZT6gujmGF3sw+0pwYJmCimyQz9qQhc
         xvnYsMH+uFCt4gxroZoC3C3JXj5UNQoIjaX4J6hR7q8gpOZmsdDHBzxyfflWEhN/tMvo
         y19AOFsDwhApFqoF6j4QW65poQBY2/8EphhpYUmS0EVf98hArZOojr8i5C/O43CzqJMW
         +s6A==
X-Gm-Message-State: AOJu0Yy6/0N5S31rDcJwv33LCg9ksxsnq3EbqCmOqp7TiItAZvH0txf9
	50EmG7fOZlneK9jGHw5JQvDXyo5QLoR+cz6/fsZKtaJWcJkjK4FasA4zPAo22L7uwXlHLYH1bhd
	KdSWo6R7N3vXBextRyTgTCKcFhbdaVvER
X-Gm-Gg: ASbGnct4GC1+jAVp9KCaP4L7yruBmg117JXChMVBwCuxpCfyjzNQUeDlE7QsIVLuAJt
	6fKPNYSCtNKALgp/wVqAbT3vKKSJNcyjoImp/4gC/tvRgFmH0A2qMBGdD8PkTuCwRP0+UD9D310
	YbRVI2BGbsOD/OUVAiNzh8mEuRYw==
X-Google-Smtp-Source: AGHT+IGW9QkKVmjwepEK3Gekl3k8m7sDFLeeKk87jjLrOcXNFAupS/oAOazeHBX2XSlJ5Xk0PJw9Gt//u9qVvEO6oe8=
X-Received: by 2002:a17:90b:1dca:b0:2fc:a3b7:108e with SMTP id
 98e67ed59e1d1-2ff7ce63264mr4342429a91.4.1741342806348; Fri, 07 Mar 2025
 02:20:06 -0800 (PST)
MIME-Version: 1.0
From: Hobbyist Search <dhlee0414@gmail.com>
Date: Fri, 7 Mar 2025 19:19:55 +0900
X-Gm-Features: AQ5f1JrHASyDUddL25xeYzU0XBfYDYyRILHRNeL53Z9JtaKQAIYGMBlyVZzj4aM
Message-ID: <CALp7_LO4UfiCesmue=fJ9CBLv8cY2ZaO8cSys9W5MpyRUEtC_A@mail.gmail.com>
Subject: Some AMD modules fail to build on meta-amd in master branch OpenBMC
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000679ff0062fbdf7db"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 11 Mar 2025 09:42:13 +1100
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

--000000000000679ff0062fbdf7db
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi. I got a build failure while doing bitbake.

These are bmc-retimer-update.bb and library-retimer.bb files.

I got an error when I built the files in the master branch, and I also got
an error when I built them by referencing the SRC_URI and SRCREV of the
sp7-a0 branch.

I looked for the bmc-retimer-update repository in the git repository, but I
couldn't find it.

How can I build it?
Can you tell me the exact repository address or SRC_URI and SRCREV?

Please.

Here are the bitbake instructions and the failures

ERROR: libaries-retimer-1.0-r0 do_fetch: Fetcher failure: Fetch command
export PSEUDO_DISABLED=3D1; export
DBUS_SESSION_BUS_ADDRESS=3D"unix:path=3D/run/user/1000/bus"; export
SSH_AGENT_PID=3D"1638"; export SSH_AUTH_SOCK=3D"/run/user/1000/keyring/ssh"=
;
export
PATH=3D"/home/dhlee/openBMC/master_b/build/sp5/tmp/work/armv7ahf-vfpv4d16-o=
penbmc-linux-gnueabi/libaries-retimer/1.0-r0/recipe-sysroot-native/usr/bin/=
python3-native:/home/dhlee/openBMC/master_b/scripts:/home/dhlee/openBMC/mas=
ter_b/build/sp5/tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/libaries-r=
etimer/1.0-r0/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi:/home=
/dhlee/openBMC/master_b/build/sp5/tmp/work/armv7ahf-vfpv4d16-openbmc-linux-=
gnueabi/libaries-retimer/1.0-r0/recipe-sysroot/usr/bin/crossscripts:/home/d=
hlee/openBMC/master_b/build/sp5/tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gn=
ueabi/libaries-retimer/1.0-r0/recipe-sysroot-native/usr/sbin:/home/dhlee/op=
enBMC/master_b/build/sp5/tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/l=
ibaries-retimer/1.0-r0/recipe-sysroot-native/usr/bin:/home/dhlee/openBMC/ma=
ster_b/build/sp5/tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/libaries-=
retimer/1.0-r0/recipe-sysroot-native/sbin:/home/dhlee/openBMC/master_b/buil=
d/sp5/tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/libaries-retimer/1.0=
-r0/recipe-sysroot-native/bin:/home/dhlee/openBMC/master_b/poky/bitbake/bin=
:/home/dhlee/openBMC/master_b/build/sp5/tmp/hosttools";
export HOME=3D"/home/dhlee"; LANG=3DC git -c core.fsyncobjectfiles=3D0 clon=
e
--bare --mirror ssh://git@github.com/AMDESE/bmc-retimer-update.git
/home/dhlee/openBMC/master_b/build/sp5/downloads/git2/github.com.AMDESE.bmc=
-retimer-update.git
--progress failed with exit code 128, output:
Cloning into bare repository
'/home/dhlee/openBMC/master_b/build/sp5/downloads/git2/github.com.AMDESE.bm=
c-retimer-update.git'...
ERROR: Repository not found.
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.

ERROR: libaries-retimer-1.0-r0 do_fetch: Fetcher failure for URL: 'git://
git@github.com/AMDESE/bmc-retimer-update.git;branch=3Dinteg_sp7;protocol=3D=
ssh'.
Unable to fetch URL from any source.
ERROR: Logfile of failure stored in:
/home/dhlee/openBMC/master_b/build/sp5/tmp/work/armv7ahf-vfpv4d16-openbmc-l=
inux-gnueabi/libaries-retimer/1.0-r0/temp/log.do_fetch.22235
ERROR: Task
(/home/dhlee/openBMC/master_b/meta-amd/meta-common/recipes-amd/bmc-retimer-=
update/libaries-retimer.bb:do_fetch)
failed with exit code '1'


Please tell me the answer.
Thanks.

--000000000000679ff0062fbdf7db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail-markdown-body"><div class=3D"gmail-Box=
-sc-g0xbh4-0 gmail-markdown-body gmail-NewMarkdownViewer-module__safe-html-=
box--cRsz0"><p dir=3D"auto">Hi. I got a build failure while doing bitbake.<=
/p>
<p dir=3D"auto">These are <a href=3D"http://bmc-retimer-update.bb">bmc-reti=
mer-update.bb</a> and <a href=3D"http://library-retimer.bb">library-retimer=
.bb</a> files.</p>
<p dir=3D"auto">I got an error when I built the files in the master=20
branch, and I also got an error when I built them by referencing the=20
SRC_URI and SRCREV of the sp7-a0 branch.</p>
<p dir=3D"auto">I looked for the bmc-retimer-update repository in the git r=
epository, but I couldn&#39;t find it.</p>
<p dir=3D"auto">How can I build it?<br>
Can you tell me the exact repository address or SRC_URI and SRCREV?</p><p d=
ir=3D"auto"></p><p dir=3D"auto">
Please.</p><p dir=3D"auto"></p><p dir=3D"auto">Here are the bitbake instruc=
tions and the failures</p><p dir=3D"auto">ERROR: libaries-retimer-1.0-r0 do=
_fetch: Fetcher failure:=20
Fetch command export PSEUDO_DISABLED=3D1; export=20
DBUS_SESSION_BUS_ADDRESS=3D&quot;unix:path=3D/run/user/1000/bus&quot;; expo=
rt=20
SSH_AGENT_PID=3D&quot;1638&quot;; export SSH_AUTH_SOCK=3D&quot;/run/user/10=
00/keyring/ssh&quot;;
 export=20
PATH=3D&quot;/home/dhlee/openBMC/master_b/build/sp5/tmp/work/armv7ahf-vfpv4=
d16-openbmc-linux-gnueabi/libaries-retimer/1.0-r0/recipe-sysroot-native/usr=
/bin/python3-native:/home/dhlee/openBMC/master_b/scripts:/home/dhlee/openBM=
C/master_b/build/sp5/tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/libar=
ies-retimer/1.0-r0/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi:=
/home/dhlee/openBMC/master_b/build/sp5/tmp/work/armv7ahf-vfpv4d16-openbmc-l=
inux-gnueabi/libaries-retimer/1.0-r0/recipe-sysroot/usr/bin/crossscripts:/h=
ome/dhlee/openBMC/master_b/build/sp5/tmp/work/armv7ahf-vfpv4d16-openbmc-lin=
ux-gnueabi/libaries-retimer/1.0-r0/recipe-sysroot-native/usr/sbin:/home/dhl=
ee/openBMC/master_b/build/sp5/tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnue=
abi/libaries-retimer/1.0-r0/recipe-sysroot-native/usr/bin:/home/dhlee/openB=
MC/master_b/build/sp5/tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/liba=
ries-retimer/1.0-r0/recipe-sysroot-native/sbin:/home/dhlee/openBMC/master_b=
/build/sp5/tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/libaries-retime=
r/1.0-r0/recipe-sysroot-native/bin:/home/dhlee/openBMC/master_b/poky/bitbak=
e/bin:/home/dhlee/openBMC/master_b/build/sp5/tmp/hosttools&quot;;
 export HOME=3D&quot;/home/dhlee&quot;; LANG=3DC git -c core.fsyncobjectfil=
es=3D0 clone=20
--bare --mirror ssh://<a href=3D"mailto:git@github.com">git@github.com</a>/=
AMDESE/bmc-retimer-update.git
=20
/home/dhlee/openBMC/master_b/build/sp5/downloads/git2/github.com.AMDESE.bmc=
-retimer-update.git
 --progress failed with exit code 128, output:<br>
Cloning into bare repository &#39;/home/dhlee/openBMC/master_b/build/sp5/do=
wnloads/git2/github.com.AMDESE.bmc-retimer-update.git&#39;...<br>
ERROR: Repository not found.<br>
fatal: Could not read from remote repository.</p>
<p dir=3D"auto">Please make sure you have the correct access rights<br>
and the repository exists.</p>
<p dir=3D"auto">ERROR: libaries-retimer-1.0-r0 do_fetch: Fetcher failure fo=
r URL: &#39;git://<a href=3D"mailto:git@github.com">git@github.com</a>/AMDE=
SE/bmc-retimer-update.git;branch=3Dinteg_sp7;protocol=3Dssh&#39;. Unable to=
 fetch URL from any source.<br>
ERROR: Logfile of failure stored in:=20
/home/dhlee/openBMC/master_b/build/sp5/tmp/work/armv7ahf-vfpv4d16-openbmc-l=
inux-gnueabi/libaries-retimer/1.0-r0/temp/log.do_fetch.22235<br>
ERROR: Task=20
(/home/dhlee/openBMC/master_b/meta-amd/meta-common/recipes-amd/bmc-retimer-=
update/libaries-retimer.bb:do_fetch)
 failed with exit code &#39;1&#39;</p><p dir=3D"auto"><br></p><p dir=3D"aut=
o">Please tell me the answer.<br>
Thanks.</p><p dir=3D"auto"><br></p><p dir=3D"auto"><br></p><p dir=3D"auto">=
<br></p><p dir=3D"auto"></p></div></div></div>

--000000000000679ff0062fbdf7db--
