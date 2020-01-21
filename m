Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E255D143880
	for <lists+openbmc@lfdr.de>; Tue, 21 Jan 2020 09:41:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48227v610jzDqS0
	for <lists+openbmc@lfdr.de>; Tue, 21 Jan 2020 19:41:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yahoo.com (client-ip=77.238.179.189;
 helo=sonic313-22.consmr.mail.ir2.yahoo.com;
 envelope-from=max_power2005-openbmc@yahoo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256
 header.s=s2048 header.b=be9fVQQ9; dkim-atps=neutral
Received: from sonic313-22.consmr.mail.ir2.yahoo.com
 (sonic313-22.consmr.mail.ir2.yahoo.com [77.238.179.189])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4822743SJmzDqFm
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jan 2020 19:40:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1579596040; bh=XLb6i7Yz4noJRZTtljtKSN0wSZpDJBOB5k0DWkX59ns=;
 h=Date:From:To:Subject:References:From:Subject;
 b=be9fVQQ9pRpqPhY1GFJk3LX2d13KaTZ9Kl7IeH104u+/buz4IbHpa1Jx25XXzLVgr47YqOn0i5As2vrG/OUDpir8yfagugebnAqdaN+lhR9RGgvdzarZJ95M7E5mSBSd4BfPC7uS+ulKJfHg0KqBohXyJU9W+/Mvvbz9BUrUzmeKzDwcn1lgZESpQLk1Y/KC6AS5fhW69HNcL+xpX0mV9PW3Z1GiVLvxIzTWcnwrudhGJj0pm2ShAIyUjoyoyWgEVOZjKZ2whaYhEJr4AOxvy1/agoIjb2VYD1BKhdCPtZlVAtN6UVxwx4jUi/8pAPBdoerVc5OMu9+E6utwxjDJIg==
X-YMail-OSG: aI0ghkEVM1kic0GH7bKxCS0q.2CO8QPhHRYKO2OM5vwLOWJb998hJ.sfE3ckklc
 ppd5ueT9DRd6SzZcTuXx7symabeWgEW0MMcm29NtkUR6D814LyRpy3aV5Kklwq6RZUvR_7RpmQG4
 ABMtRT72YAqkIjVZMNuI3XWEbd9lddYUXSQ3mNss7nH8xxiqUonetvHhPoEJlv6K9RzX4vnbP1_L
 486Pz0ntsq0kn6CgTkPtHvqA9Orwo30pYX400aTz_rBE1puiv9w2r.PvPQ.ID8eqVd88hI219VXz
 ws07fIHuKDFULKlcDWf0tj7AHvQYulw.qgUu4X_Q_DCZdIVnsg2NElrSAYDHvGVkLPoAvb_wiPPv
 _ZIZFltJwI56nMqg_P7vJiSk_._f8Q2lZq9LtsKzIheJIfkY3CklSpj8VaVweX5h8FHPRYPy8sRn
 bM7xwIFIhQpxrDiJBflf5KS.mIQItYdBsl3PtazOZxeeEWS.AL70VEhWlYEYGFmCnG99qNsZK28v
 PLqtUPQq2mxjwstN3lsbEPbeHikvrxvgoPSBRBjkILmfr0KFG4pgVN3gjxexkZuphY3ZVhTjIpN2
 idJVmX4PGBAEPvGF1NXw7EznQm0TeViT8vnNY7wHHedwlmSrhphgT_WLROxDbSscGUvXHvFbFsUq
 PMNtCOit3fCuIej3OzMoicTwcsewvnw5a8Om2842Yn84irtnB6g0Dgl2Ev2wdzE0Ch6Nm7tJqtYZ
 n86_brmw.eTjxZmc7QAc0POb75hzXo2MRWPin9Cs64IcEqsQ_5mueLgjOinqlVJt6H92YlV4KxF6
 mAqsvCxW0WfT1T4KFiCZibCXbQGE7oCIaqABAvWpLkRXjf2GYE157cPDs6bVFadsgR8UDOOS1KgW
 3kBtVafI6MAQie1gN9Vr11C_v__nPoJNJEWVVOA_OtWhMCxm_M5OsWKpKLPRRpn4Iou9C7lQc1IZ
 5EM0IOMFx9dbCEOlsRzrT71JT37dEaSmBS4_.ALJO3jETtRwB9.0LmM0.8eIS1FecfTy0d.FKv4m
 mz8ea_T_EZoPERPoi9GH4m2SkPiV5wCm6x5OBefdLZ.kc7WwnrCjMDoM1FngbrREGyJPP43FWvvs
 QHQ1iu7kBzfdB2xNXN0s2rcr.XBVGCvkdnDdx6P32z6EDVB_8wx2ofipGmKJlHsguz4viO2HbiM7
 4gVqMEUao9K5YG2otJvRLdbcv5KxjULIFQvD5RRgunlVBd16DuKXxxKOgFjqQrVURArETNqLsaeq
 zXQJENTSr.UEBOIW3M.8h9yh6WRLPFquTYLNgknrfoF3JvuLc2mPfYJlJwVEAa2LCPQ--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.ir2.yahoo.com with HTTP; Tue, 21 Jan 2020 08:40:40 +0000
Date: Tue, 21 Jan 2020 08:40:39 +0000 (UTC)
From: Max Power <max_power2005-openbmc@yahoo.com>
To: openbmc@lists.ozlabs.org
Message-ID: <2064951776.24636656.1579596039011@mail.yahoo.com>
Subject: No support for clearing the recv irq bit
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <2064951776.24636656.1579596039011.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.14873 YMailNodin Mozilla/5.0 (X11; Linux i686;
 rv:52.0) Gecko/20100101 Firefox/52.0 SeaMonkey/2.49.5 Lightning/5.4
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

Hi

The Linux IPMI driver complains about missing support for "clearing the recv irq bit":

[   11.531387] ipmi message handler version 39.2
[   11.553034] ipmi device interface
[   11.641272] IPMI System Interface driver.
[   11.641288] ipmi_si dmi-ipmi-si.0: ipmi_platform: probing via SMBIOS
[   11.641291] ipmi_si: SMBIOS: io 0xca2 regsize 1 spacing 1 irq 0
[   11.641292] ipmi_si: Adding SMBIOS-specified kcs state machine
[   11.641315] ipmi_si IPI0001:00: ipmi_platform: probing via ACPI
[   11.641339] ipmi_si IPI0001:00: [io  0x0ca2] regsize 1 spacing 1 irq 0
[   11.641341] ipmi_si dmi-ipmi-si.0: Removing SMBIOS-specified kcs state machine in favor of ACPI
[   11.641342] ipmi_si: Adding ACPI-specified kcs state machine
[   11.641393] ipmi_si: Trying ACPI-specified kcs state machine at i/o address 0xca2, slave address 0x20, irq 0
[   12.083482] ipmi_si IPI0001:00: The BMC does not support clearing the recv irq bit, compensating, but the BMC needs to be fixed.
[   12.476372] ipmi_si IPI0001:00: IPMI kcs interface initialized

Is this something to be worried about or can it be ignored?

Max

