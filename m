Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 572D1DF64E
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2019 21:52:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xnP36CM3zDqJg
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 06:52:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=5197956ce2=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="K6UDTZNu"; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46xnKC6tmpzDqL9
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 06:49:35 +1100 (AEDT)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id x9LJnMfo020305
 for <openbmc@lists.ozlabs.org>; Mon, 21 Oct 2019 12:49:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=uMPLZudvHw0j6sIKfNqOlx3Nki++v8QXEdIUUJe1BFI=;
 b=K6UDTZNuiriKj4IUNnFY+YcJAv6qD6Mp3tIPVNwx06ynkCYc7iKrcSN6Sy17hFDpBMZy
 NwLc4XJwhS1VjHTos2fEdxYAluNVkdLG+lvNn3KGREED3ty1nav3gTbMU+VQbE110rvX
 C7ayHO7i023WbUjNtKaRAfKLKWTxzbppVrY= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0089730.ppops.net with ESMTP id 2vqwyygnfx-13
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 21 Oct 2019 12:49:33 -0700
Received: from 2401:db00:12:9028:face:0:29:0 (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:82::e) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 21 Oct 2019 12:49:05 -0700
Received: by devvm1794.vll1.facebook.com (Postfix, from userid 150176)
 id B14F864C3C92; Mon, 21 Oct 2019 12:49:03 -0700 (PDT)
Smtp-Origin-Hostprefix: devvm
From: Tao Ren <taoren@fb.com>
Smtp-Origin-Hostname: devvm1794.vll1.facebook.com
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>
Smtp-Origin-Cluster: vll1c12
Subject: [PATCH 0/4] ARM: dts: aspeed: add dtsi for Facebook AST2500 Network
 BMCs
Date: Mon, 21 Oct 2019 12:48:16 -0700
Message-ID: <20191021194820.293556-1-taoren@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-21_05:2019-10-21,2019-10-21 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 malwarescore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=552 impostorscore=0
 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910210190
X-FB-Internal: deliver
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
Cc: Tao Ren <taoren@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The patch series adds "facebook-netbmc-ast2500-common.dtsi" which defines
devices that are common cross all Facebook AST2500 Network BMC platforms.
The major purpose is to minimize duplicated device entries among Facebook
Network BMC dts files.

Patch #1 (of 4) adds "facebook-netbmc-ast2500-common.dtsi" file, and the
remaining 3 patches update CMM, Minipack and Yamp device tree to consume
the new dtsi file.

Tao Ren (4):
  ARM: dts: aspeed: add dtsi for Facebook AST2500 Network BMCs
  ARM: dts: aspeed: cmm: include dtsi for common network BMC devices
  ARM: dts: aspeed: minipack: include dtsi for common network BMC
    devices
  ARM: dts: aspeed: yamp: include dtsi for common network BMC devices

 arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts | 66 ++++---------
 .../boot/dts/aspeed-bmc-facebook-minipack.dts | 59 ++++--------
 .../arm/boot/dts/aspeed-bmc-facebook-yamp.dts | 62 +-----------
 .../dts/facebook-netbmc-ast2500-common.dtsi   | 96 +++++++++++++++++++
 4 files changed, 136 insertions(+), 147 deletions(-)
 create mode 100644 arch/arm/boot/dts/facebook-netbmc-ast2500-common.dtsi

-- 
2.17.1

