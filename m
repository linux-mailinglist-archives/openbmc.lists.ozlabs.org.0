Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D74971400EE
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 01:27:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zMN56yT0zDrMy
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 11:27:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=216.205.24.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=bruce_mitchell@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=scW++zvv; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [216.205.24.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zMMG5ZYMzDrL1
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2020 11:26:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1579220812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0voE4c55pR1UEDHa8X16fM0/SDBtCGzZwSFH1jL8eig=;
 b=scW++zvvWZCLt+yimZkQP0Xl92L6ufjg1JvAYjE5vlFJV6inyUHxrDGs3TRQyMtOtvh8/s
 Q5vCmXguKrxZisCUoyi+Ujwu2zLVCQMMCE7GimcsozyoIDRYI8rItKT0JNk+12Yu3h5K2k
 o34UIOuDF1N7IkyX+fXhtbW8gHZsAvQ=
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-Yf0mX1CONHi9FA726HLvIQ-1; Thu, 16 Jan 2020 19:26:50 -0500
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Thu, 16 Jan 2020 16:26:21 -0800
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Thu, 16 Jan 2020 16:26:15 -0800
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Which repo is more stable, feature complete, most functionality?
 https://github.com/openbmc/openbmc or https://github.com/Intel-BMC/openbmc
Thread-Topic: Which repo is more stable, feature complete, most functionality?
 https://github.com/openbmc/openbmc or
 https://github.com/Intel-BMC/openbmc
Thread-Index: AdXMzLm+yefvKybER6mmRI5lr0TYXA==
Date: Fri, 17 Jan 2020 00:26:14 +0000
Message-ID: <8117ef0c5f9a4c599ebe1d53aae209b3@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.122.68.174]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
X-MC-Unique: Yf0mX1CONHi9FA726HLvIQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: phoenix.com
Content-Type: text/plain; charset=WINDOWS-1252
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Which repo is more stable, feature complete, most functionality?  https://g=
ithub.com/openbmc/openbmc or https://github.com/Intel-BMC/openbmc

While the WebUI for https://github.com/Intel-BMC/openbmc may look better,
presently its functionality for BMC operation seems intermittent compared t=
o the functionality of https://github.com/openbmc/openbmc.
I am referring to basic things such as displaying the BMC's Firmware Versio=
n, the lack of displaying any NIC for Network Settings, the "hang" for Heal=
th Hardware Status. =20

This is not a request about ahead or behind; I am asking about stable, feat=
ure complete, most functionality.

Using a metaphor here; if you had to select today one of the 2 for controll=
ing your car's breaks which would it be?

Thank you.

