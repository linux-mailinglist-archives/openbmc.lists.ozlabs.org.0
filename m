Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EEBBD941
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 09:40:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dVN000FWzDqg7
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 17:40:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::834; helo=mail-qt1-x834.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Js65Irpy"; 
 dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dVMN6BB2zDqYp
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 17:40:00 +1000 (AEST)
Received: by mail-qt1-x834.google.com with SMTP id o12so5434345qtf.3
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 00:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=FGv5brbukmJdmrjN9Kcl0sn1KzD+RdKdFB6ZraUDH64=;
 b=Js65IrpyoC2TiOzz6/Ld5He2m2kuVOYbSMbLpVm3IRtDlj5cvWAnElICJkmOqUNc4y
 tt59W8VkFBZQFIt2BVTFIyQvjx1ORExZPUoY317M+1wf1Cqpccey2qBDZ1EA3s6R6Yb4
 p+yQxpbk2X6z8JpgDCU86Z84CzjidxXsEtg98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=FGv5brbukmJdmrjN9Kcl0sn1KzD+RdKdFB6ZraUDH64=;
 b=aOg1FzllOjyMkrirvLhNqQSR5zY8fHdCiSSojF1l3BLRi9a9lAmSePnrWRpZtq/IRA
 RLK40lhinrWBexyVde/2qVygOHvtV8O/NRHc7OyNJKHRXHf+0HmHK7Gpouok/MQWgavp
 erM1gdLTdsV7YTDZDzXFFPhLUuPdPWfIfG3dPEmeU8xL4dlpv394cCoAOWHVpQ+nUdqr
 bJW7GClAl5qx8I8xBwyh+QjSp45qMBe/B2LGcP0h1EhLqeY3wONcWL2bK3/T7V63ksIc
 8PMJU0w7hGWGip0kwqZ+3gUBzgE2sPAoLCARF6jJv1TgzfPH0mwIUHuuRrkwBVj2NIA/
 pJEQ==
X-Gm-Message-State: APjAAAWpAb+jRphbyna1dXmBZiyd12k5H3qHfjUhRD+0GpLbInlASR2x
 9S7Aw3AGUCytdXOXM8ClQChD5E9rzWW+ykJifqyIQw==
X-Google-Smtp-Source: APXvYqyWappE28auy/mioGmha04l4flzsB0hdO8nZzWfp0XF45+BVDj5Lu6NVvFt18FUmMQQJ+F/UFcytYrnAZv9ZfM=
X-Received: by 2002:aed:2ce7:: with SMTP id g94mr7244104qtd.255.1569397196657; 
 Wed, 25 Sep 2019 00:39:56 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 25 Sep 2019 17:09:44 +0930
Message-ID: <CACPK8XcK+_ZSgYxpzyFVZgFTxv_11XsBUwQD7SLNgz6zyk0Duw@mail.gmail.com>
Subject: LPC irq nobody cared errors
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000006b19ef05935bc2ae"
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

--0000000000006b19ef05935bc2ae
Content-Type: text/plain; charset="UTF-8"

Hello Jae,

I noticed that Intel has a sizable out of tree kernel patch set. It would
be great if you could contribute this code to the OpenBMC kernel tree (and
upstream) so the community can benefit from your hard work.

In particular, I hit an issue today that is fixed by these three patches:

https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-common/recipes-kernel/linux/linux-aspeed/0044-misc-Add-clock-control-logic-into-Aspeed-LPC-SNOOP-d.patch

https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-common/recipes-kernel/linux/linux-aspeed/0043-char-ipmi-Add-clock-control-logic-into-Aspeed-LPC-BT.patch

https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-common/recipes-kernel/linux/linux-aspeed/0045-char-ipmi-Add-clock-control-logic-into-Aspeed-LPC-KC.patch

If you could clean them up and submit them that would be appreciated.

Cheers,

Jeol

--0000000000006b19ef05935bc2ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello Jae,<br>
<br>
I noticed that Intel has a sizable out of tree kernel patch set. It would b=
e great if you could contribute this code to the OpenBMC kernel tree (and u=
pstream) so the community can benefit from your hard work.<br>
<br>
In particular, I hit an issue today that is fixed by these three patches:<b=
r>
<br>
<a href=3D"https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mod=
s/meta-common/recipes-kernel/linux/linux-aspeed/0044-misc-Add-clock-control=
-logic-into-Aspeed-LPC-SNOOP-d.patch" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mo=
ds/meta-common/recipes-kernel/linux/linux-aspeed/0044-misc-Add-clock-contro=
l-logic-into-Aspeed-LPC-SNOOP-d.patch</a><br>
<br>
<a href=3D"https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mod=
s/meta-common/recipes-kernel/linux/linux-aspeed/0043-char-ipmi-Add-clock-co=
ntrol-logic-into-Aspeed-LPC-BT.patch" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mo=
ds/meta-common/recipes-kernel/linux/linux-aspeed/0043-char-ipmi-Add-clock-c=
ontrol-logic-into-Aspeed-LPC-BT.patch</a><br>
<br>
<a href=3D"https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mod=
s/meta-common/recipes-kernel/linux/linux-aspeed/0045-char-ipmi-Add-clock-co=
ntrol-logic-into-Aspeed-LPC-KC.patch" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mo=
ds/meta-common/recipes-kernel/linux/linux-aspeed/0045-char-ipmi-Add-clock-c=
ontrol-logic-into-Aspeed-LPC-KC.patch</a><br>
<br>
If you could clean them up and submit them that would be appreciated.<br>
<br>
Cheers,<br>
<br>
Jeol<br></div>

--0000000000006b19ef05935bc2ae--
