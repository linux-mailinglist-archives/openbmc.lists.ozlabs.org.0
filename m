Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC244C2AA
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 23:01:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Tcnw3j8CzDqtN
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 07:01:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=107391e0c1=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="YEo/HSPd"; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tcmr398ZzDqsK
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2019 07:00:58 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x5JKwoZh030674
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jun 2019 14:00:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=r7JuZr+R8cAQf0CwlWsiXVI+rKV4iYlulYGHumQSQ9g=;
 b=YEo/HSPdagpqcGICFuaSTAyHkPgRUBPjoNMQ2s2nfb3/la8NjZddgvcFr1gO/34e/CfL
 Poh00ndBUE5okev6A7HsCD0p4z//Xa7tx6FiKFW8v0rEmL2cljJxb4gTuAmPcZlHK66M
 a9jJ7Wwf0LQMKcuRd5daPN7q+/lVovgCX94= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by m0089730.ppops.net with ESMTP id 2t7s8xgrwf-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jun 2019 14:00:56 -0700
Received: from mx-out.facebook.com (2620:10d:c081:10::13) by
 mail.thefacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5;
 Wed, 19 Jun 2019 14:00:52 -0700
Received: by devvm24792.prn1.facebook.com (Postfix, from userid 150176)
 id 3183D164B5293; Wed, 19 Jun 2019 13:50:20 -0700 (PDT)
Smtp-Origin-Hostprefix: devvm
From: Tao Ren <taoren@fb.com>
Smtp-Origin-Hostname: devvm24792.prn1.facebook.com
To: Brendan Higgins <brendanhiggins@google.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>,
 <linux-i2c@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Smtp-Origin-Cluster: prn1c35
Subject: [PATCH 2/2] dt-bindings: i2c: aspeed: add base-clock-divisor property
Date: Wed, 19 Jun 2019 13:50:18 -0700
Message-ID: <20190619205018.4177192-1-taoren@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=541 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906190172
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

"base-clock-divisor" allows people to customize ASPEED I2C Controller's
Base Clock, which in turn adjusts all other I2C AC timing settings.

Signed-off-by: Tao Ren <taoren@fb.com>
---
 Documentation/devicetree/bindings/i2c/i2c-aspeed.txt | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
index 8fbd8633a387..0c08df847c6f 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
@@ -13,9 +13,11 @@ Required Properties:
 - interrupts		: interrupt number
 
 Optional Properties:
-- bus-frequency	: frequency of the bus clock in Hz defaults to 100 kHz when not
-		  specified
-- multi-master	: states that there is another master active on this bus.
+- bus-frequency		: frequency of the bus clock in Hz defaults to 100 kHz
+			  when not specified
+- multi-master		: states that there is another master active on this bus.
+- base-clock-divisor	: the divisor defines the frequency of Base Clock which
+			  is divided from APB bus clock. Valid values are 0-15.
 
 Example:
 
-- 
2.17.1

