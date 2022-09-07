Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 545415AFCD7
	for <lists+openbmc@lfdr.de>; Wed,  7 Sep 2022 08:50:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMtF11PPcz3bdN
	for <lists+openbmc@lfdr.de>; Wed,  7 Sep 2022 16:50:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru header.a=rsa-sha256 header.s=default header.b=Ql1BeFZX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yandex-team.ru (client-ip=2a02:6b8:0:1472:2741:0:8b6:217; helo=forwardcorp1p.mail.yandex.net; envelope-from=kitsok@yandex-team.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru header.a=rsa-sha256 header.s=default header.b=Ql1BeFZX;
	dkim-atps=neutral
X-Greylist: delayed 134 seconds by postgrey-1.36 at boromir; Wed, 07 Sep 2022 16:50:17 AEST
Received: from forwardcorp1p.mail.yandex.net (forwardcorp1p.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b6:217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMtDT4kxKz2xvH
	for <openbmc@lists.ozlabs.org>; Wed,  7 Sep 2022 16:50:17 +1000 (AEST)
Received: from vla5-d6ec41cad181.qloud-c.yandex.net (vla5-d6ec41cad181.qloud-c.yandex.net [IPv6:2a02:6b8:c18:348f:0:640:d6ec:41ca])
	by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 314352E097F;
	Wed,  7 Sep 2022 09:47:51 +0300 (MSK)
Received: from 2a02:6b8:c0d:3192:0:640:36b7:415c (2a02:6b8:c0d:3192:0:640:36b7:415c [2a02:6b8:c0d:3192:0:640:36b7:415c])
	by vla5-d6ec41cad181.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id 7jNHj80NRuQ1-lpNWdnRb;
	Wed, 07 Sep 2022 09:47:51 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru; s=default;
	t=1662533271; bh=YOOg/9ZZ+YG5JMN4Ah4jou+cuoVlVh8iDFZo7yl9UB4=;
	h=Subject:In-Reply-To:Date:References:To:From:Message-Id;
	b=Ql1BeFZXgDD+A3vjyLWlhBedmRxAYamEkVkkbEf3gzyzfhshWcZRyoHbULHMEbzT0
	 xb0NA6VoxbAF4rQrGO+JMRP5dOqpyGtqOQwhjMKEKE7Z2Z8iFIhVztRU4bkHwdY6Rr
	 eqy1SsU9CzcrfZdx3EpXn317sltEW8OTdeDEivtY=
Authentication-Results: vla5-d6ec41cad181.qloud-c.yandex.net; dkim=pass header.i=@yandex-team.ru
Received: from myt6-af0b0b987ed8.qloud-c.yandex.net (myt6-af0b0b987ed8.qloud-c.yandex.net [2a02:6b8:c12:2388:0:640:af0b:b98])
	by myt6-79704c0e15e4.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id NlNg080Jc0U1-WgFVDgBj
	for <kitsok@yandex-team.ru>; Wed, 07 Sep 2022 09:47:41 +0300
Received: by myt6-af0b0b987ed8.qloud-c.yandex.net with HTTP;
	Wed, 07 Sep 2022 09:47:41 +0300
From: Konstantin Klubnichkin <kitsok@yandex-team.ru>
To: Johnathan Mantey <johnathanx.mantey@intel.com>,
	Paul Fertser <fercerpav@gmail.com>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
In-Reply-To: <2cdb6ea6-fc85-9835-d410-01195148a3eb@intel.com>
References: <YxXZeFQhJWDSHSVf@home.paul.comp> <2cdb6ea6-fc85-9835-d410-01195148a3eb@intel.com>
Subject: Re: SATA hotplug notifications for BMC inventory updates
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Wed, 07 Sep 2022 09:47:51 +0300
Message-Id: <17841662532977@mail.yandex-team.ru>
Content-Transfer-Encoding: 8bit
Content-Type: text/html; charset=utf-8
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

<div>Hi Johnathan,</div><div> </div><div>What do you think about implementing this feature using SMI?</div><div>Is it possible to raise SMI on drive plug/removal?</div><div> </div><div>Thank you!</div><div> </div><div>06.09.2022, 18:54, "Johnathan Mantey" &lt;johnathanx.mantey@intel.com&gt;:</div><blockquote><div>On 9/5/22 04:11, Paul Fertser wrote:</div><blockquote><pre>Hi,

An OCP Tioga Pass platform features up to 4 drive bays for SATA
storage accessible from the front and fully hot-pluggable. The
backplane is usually connected directly to Intel C620 PCH (aka
Lewisburg).

It would be nice to have information about the currently attached
devices (model and serial number) available in BMC inventory but what
are the ways to get this information?</pre></blockquote><p>Intel systems only get drive mdl/sn from NVMe devices that provide that information via MCTP over SMBus. SAS/SATA drives, to my current knowledge, don't supply this info in that mode.</p><p>The insertion/removal events are also managed from the BMC via I2C to a FPGA solution residing on the Hot Swap Backplane. The FPGA provides registers that allow the BMC to query the PRSTn/IFDETn pins.</p><blockquote><pre>Is it possible there's some additional module in the all-mighty ME
that can supply BMC with the current state of PCH SATA controller? Or
is there some other sensible mechanism other than talking to UEFI on
startup (which would mean BMC is showing stale and thus misleading
data till the next reboot)?

Even though the question is quite specific we'd appreciate any related
insights on the topic; there must be some side-channels to RAID
controllers and such for BMC to be obtaining essential information but
so far I wasn't able to find any documentation about this.
</pre></blockquote>RAID solutions are outside of scope for the Intel BMC.<pre> </pre><div>--<br /><font color="#1F497D" face="Century Gothic">Johnathan Mantey<br />Senior Software Engineer<br /></font><font color="#555555" face="Century Gothic"><strong>azad technology partners</strong><br /></font><font color="#1F497D" face="Century Gothic">Contributing to Technology Innovation since 1992</font><font color="#555555" face="Century Gothic"><br /></font><font color="#1F497D" face="Century Gothic">Phone: (503) 712-6764<br />Email: <a href="mailto:johnathanx.mantey@intel.com" rel="noopener noreferrer">johnathanx.mantey@intel.com</a></font><br /> </div></blockquote><div> </div><div> </div><div>-- </div><div>Best regards,</div><div>Konstantin Klubnichkin,</div><div>lead firmware engineer,</div><div>server hardware R&amp;D group,</div><div>Yandex Moscow office.</div><div>tel: +7-903-510-33-33</div><div> </div>
