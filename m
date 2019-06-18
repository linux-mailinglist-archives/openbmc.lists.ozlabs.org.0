Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2304AD83
	for <lists+openbmc@lfdr.de>; Tue, 18 Jun 2019 23:44:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45T1nn0rNKzDqWM
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 07:44:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=benjaminfair@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="kVvxte9j"; 
 dkim-atps=neutral
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45T1l101YjzDqLH
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jun 2019 07:42:19 +1000 (AEST)
Received: by mail-io1-xd35.google.com with SMTP id e3so33246814ioc.12
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jun 2019 14:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AvsBQuncXKMU8fch/6do2idc/uJCuhzSye2GAk8jXwM=;
 b=kVvxte9jZ+j+NJNezcWxwOanIyB1sGrJsl31yhfjIJvh3idMKX5IJ6+tyk3UZaYrU2
 3HPWZwYzRBwmEIMC14IpFZggoiW9VLygAuzkVqeebD7cdKOqX3+kbion40EHANJCMi0A
 oX/AgPKuE47cRH12e/BL29RpsT/L9fp9sofUy2Yz1JMocjExhSQ9xvAryDPqi8LU4Wl6
 AaHJF3KOIsCaz1Ld97J8UUhXFSjf7QRrNacfc3qevTFMm9qBMqpAhgY3xtUucKO5Od7i
 m45TOMZqAtK/K0bejKg2X4cuVZWKaNAaz9HALkaSgpwY8H9n0rF1QSDcvjwW7ezZKJg4
 Vw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AvsBQuncXKMU8fch/6do2idc/uJCuhzSye2GAk8jXwM=;
 b=r6ou8CXqKSrz6z5bcFi410LTvxRSV9CXUnS2P/tPJdjOVoHM3VIqVksSrnffBM9cz0
 gwuexKdULFaiirogh1940IomtJVBu1k3W7bF4E3oNVG9bWCpR39kYiBLKKhgCu3PvaXf
 iaNtnpMgf6IRyHxTbCWpv4TNYsYcU+jdsos6y7cSljI4nVljs8C87JVSmMU+ES0KE4Yc
 x+T+LegoP2hsjPJLHSSwX9ys7ef1HqilpRs6wjrEjJb2G+NV/QVAiUqytgZmGqJw6Ecj
 NUga7j71lTzLWHG7/iXN/YBtr1WkdEuxGu2Z1IHON0JEc7iFP2OUUDmrtwIBoVzYxxfS
 nJQA==
X-Gm-Message-State: APjAAAW281ENLstn5Vc6/6oqwtARSjjD8mO2JMA2Z3i873HAq+CLTxLw
 eqPpX5oPyaRWUu8qnL1Lq4Z82/2JDF3dk1pR/6j8fw==
X-Google-Smtp-Source: APXvYqzs2n292JY245Ne26Dmv5guhtM6jxNUQ2jk6XeDLm/2gNKMatMfbhRQ4jWdNXDXJZL2NHRXY/LkIkFjcehVffk=
X-Received: by 2002:a5e:9314:: with SMTP id k20mr2864486iom.235.1560894134172; 
 Tue, 18 Jun 2019 14:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <963572AF-71AC-4830-ACBE-CABBFDD2B929@fb.com>
 <d3212ced-52c2-9c30-7857-3a2f2b98aa3a@linux.intel.com>
In-Reply-To: <d3212ced-52c2-9c30-7857-3a2f2b98aa3a@linux.intel.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Tue, 18 Jun 2019 14:41:37 -0700
Message-ID: <CADKL2t57YnSFE0cABmnqUuGfo+p1sxQhgXY90JbU2LiVNHYziQ@mail.gmail.com>
Subject: Re: NVME-MI temperature sensors
To: James Feist <james.feist@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jun 18, 2019 at 1:31 PM James Feist <james.feist@linux.intel.com> wrote:
>
> On 6/18/19 1:07 PM, Vijay Khemka wrote:
> > Team,
> >
> > I am trying to expose temperature sensor provided by NVME SSD drive. As
> > per NVME-MI spec device provides temperature sensor value at defined
> > register. Is there any Linux kernel driver, I need to enable to get
> > these sensors of a SSD device we have. I see some NVME temperature
> > sensors definition in meta-quanta/meta-gsj config.yaml and was wondering
> > how are these read.
> >
> > Any information on this would be helpful.
>
> This might be interesting to you:
> https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/20859
>

That's the MCTP implementation which is the direction everything is
moving towards.

In the short term, Quanta is working on a daemon[0] to monitor
temperature and other telemetry data over NVMe-MI on SMBus. They have
an implementation on their own GitHub[1] and are currently in the
process of upstreaming it[2].

[0] https://github.com/openbmc/phosphor-nvme
[1] https://github.com/quanta-bmc/phosphor-nvme
[2] https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-nvme/+/22560

>
> -James
>
> >
> > Regards
> >
> > -Vijay
> >
