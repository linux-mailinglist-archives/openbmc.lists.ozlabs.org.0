Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE661C3F1F
	for <lists+openbmc@lfdr.de>; Mon,  4 May 2020 17:55:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49G6rq4ctVzDqW5
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 01:55:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22b;
 helo=mail-oi1-x22b.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EhDHIer2; dkim-atps=neutral
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49G6p92JQQzDqW5
 for <openbmc@lists.ozlabs.org>; Tue,  5 May 2020 01:53:17 +1000 (AEST)
Received: by mail-oi1-x22b.google.com with SMTP id m10so7035090oie.6
 for <openbmc@lists.ozlabs.org>; Mon, 04 May 2020 08:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=rCGEuYiyTsSc5yZ/6qwjdJn3I5nqWK117mRItjWrnjs=;
 b=EhDHIer2eduRxXmwA8dbb1Qot7P7j5WwjvGCd0Ja0NcV00apeUCBKgYeqzb4P4RyxM
 7WvtN4eF6cEq0o4KzsQxqkvZz5YUe5JCfY+1xy9SyxOJrdOXh8pXCEhJz/O5AZCShkA7
 doBMyuBOBJ1ZsB95jKIEnk8kG+V3foEx/f/EsYmMrnCW5Z0J1JE5UxwH7UuRpAuapkVM
 +wZwqdbUIGYy1q2oo5XFZDBJFiXCSsI381fpr+AMyY2WU59Blm6E5rYeVFbYFqMQDT+e
 BJ3oQTS2yM+k1rRukXVH8JhgR16K9WzdSO28W5c1TkxHn7H25ArVvDu62JnbLHVup1Su
 SzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=rCGEuYiyTsSc5yZ/6qwjdJn3I5nqWK117mRItjWrnjs=;
 b=Vs6qwwnZ7NoOXLVk7qeSDZR91qVq6nQSu50LSpfIoJbUAt3HkKse+3AD5T6VrhAget
 H1P+t2TE/NoTDAwTj3G/Cmvytxn5iNEpash/X5W96ndjyz9TEUhtRSnz5CaASrr5KbNv
 +JOMwwUkAkuS+lbzEsOmLTHxPCNxZoK6pvcayjR3zO0tI+ufuyZC4+A4Z5bGlV4X76eU
 7meM5OWMLYniONNtfDPPs+jBenhfGxS4YzuBrMuWbyi6j65rJcVU7+Bw/xW2HSEawxZ8
 QvaqAZH68kF5CbW+QwPrjIfX9ckYcOl2Y9GXvv7RSCZ654XgXu7l8QvMeOhgKlSWezg3
 OhYw==
X-Gm-Message-State: AGi0PuaTCWG+zHcv7h5CKdNNgW4/c1WQsTprlL4R6XR2sXeY/y0GUooF
 RSegkOZyCRLpiCzX26a8clo=
X-Google-Smtp-Source: APiQypLvxRXUCnVyWvOTJ0ylJowwOSpH0EG5VpG1UFUcUgfXzNtaGfcoYY7spv3+wf6enqLGgdSxdA==
X-Received: by 2002:a05:6808:109:: with SMTP id
 b9mr8997655oie.143.1588607594325; 
 Mon, 04 May 2020 08:53:14 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:6061:184e:d4a1:ec2d])
 by smtp.gmail.com with ESMTPSA id n132sm2555884oig.49.2020.05.04.08.53.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 May 2020 08:53:13 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: openbmc build issue.
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <PS2PR04MB354432E1908672CE27203758FDAA0@PS2PR04MB3544.apcprd04.prod.outlook.com>
Date: Mon, 4 May 2020 10:53:12 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <0B252A9A-3E34-4FA5-A872-CDA2C463500B@gmail.com>
References: <PS2PR04MB354432E1908672CE27203758FDAA0@PS2PR04MB3544.apcprd04.prod.outlook.com>
To: Kumar Thangavel <thangavel.k@hcl.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Apr 30, 2020, at 1:23 AM, Kumar Thangavel <thangavel.k@hcl.com> =
wrote:
>=20
> Hi All,
> =20
> YV2 Build failing in latest LF openbmc master. PFB the reason and the =
detailed log file. Please let me know if there are suggestions to =
resolve.
> ERROR: obmc-phosphor-image-1.0-r0 do_generate_static: Image =
'/home/velu/buildtest/openbmc/build/tmp/work/yosemitev2-openbmc-linux-gnue=
abi/obmc-phosphor-image/1.0-r0/deploy-obmc-phosphor-image-image-complete/o=
bmc-phosphor-image-yosemitev2.squashfs-xz' is too large!

Hi Kumar, you=E2=80=99ve exceeded the allowed size for you rootfs. =
You=E2=80=99ll need
to pull some functions out. The biggest bang for your buck if possible
is to remove python usage. Otherwise, you=E2=80=99ll need to find some =
functions
to pull out.

What probably caused this is upstream moved from python2 to
python3. python3 takes significantly more space in the image.


> Please fine the attachment.=20
> =20
> Thanks,
> Kumar.

