Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1E7A24549
	for <lists+openbmc@lfdr.de>; Fri, 31 Jan 2025 23:30:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yl9ZF4zjwz3c86
	for <lists+openbmc@lfdr.de>; Sat,  1 Feb 2025 09:30:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738362610;
	cv=none; b=nuJ3mS7MfApyhlQ3yXRTA0FLsL6QeLNmmvNzkTirL23wgRvftzt75ypMPvPAfrztr7mMcg2gtXeYAJMhpB7RaKsZMiwZFC3aIzMy4zj+l2LhZtW4F1xXdr/Mvuq9KVflnbOr1P4M3XNAh35ZE8kyT+vFV6NfiB2WAA2NmqHcIQlDH17HGcJFWjP2/AvaEdFc7nxu6bbwVXw0Q1gyLuaG4azP4LKNMiA+1NsEJGPISg8V0qmK7LqqxKURteR6+oERvqxswXjV37AAGSl4236kTtv9hNUGqJMlaeNyP6KX1sY4wH/Z1EdB02nDCFI5RJDpAjJxUohx9i5uW8wX+Bfdvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738362610; c=relaxed/relaxed;
	bh=DgI7GlxH7+Sz5jA0ziTbEE95oSEknuwMDw3S+7gHiIg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aR88BmrLVncBKGy+oORdKONOsd9f3znML2xmysVW+YXg9Nv50boMm/zcI+g3L8XwVqID3zg9E864X5iiYr/Ey94MlX1uAe/gXS6EkRw8CfJ1kwnkyRlJSXAwQjMLRYRggZO1BuGrrFjzL1szHCUhXWUWL9PZ5f3yFHiajDhW52qMN/gM9uQ1UJXRqLjJe5g4SsVjRUVweFyUTzSez/GH0Wxv99+NEwqfdh0gkvX0gtzUhYKLIRQu4DgpMDmiTXOMJthFVk5ucgx9alUoCiicitXHsaSdW7rLWV4VbeiBa1uiJVyd6EzIQpmx6oH8gLD9y7c/RVPIQsIYv5lQCQfxtg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UaDE9W/1; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UaDE9W/1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yl9Z95Bl9z2yVV
	for <openbmc@lists.ozlabs.org>; Sat,  1 Feb 2025 09:30:09 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VFdOH3018692;
	Fri, 31 Jan 2025 22:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=DgI7GlxH7+Sz5jA0ziTbEE95oSEknuwMDw3S+7gHi
	Ig=; b=UaDE9W/1lCjr4JCphmBi0zOvSYtCPgursHuKmTf4fR8jMsQrria4Hy4dU
	yCv8eM7vgEpU6nNonECkfMMSfH7Xg9+SJLlwI/HrFB8Sx3P3bqkYJvB2Yu/hHGeB
	HFr+KhnFnFuw3LTuxMGDOHRZZFOb61eTW1rA5doDbYW6pfbSpm2XkYXciPAyPmmb
	q+gepJdop9qWk+Q7vjdgyuLdLP1NfGBkmTOWtzhqg9eew2sk+OyTj2Y4moYQxcmL
	vwiBPBnKzKDq8hpOoRbwv95XeRtQeeT66uHS8UNB0BChGx4GfOLy0CAQCbx22/gJ
	IFJnLBFdwbQE0FbFV4AajzaJ10VNg==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44h1bt1q6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 22:29:47 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50VK9XfM017212;
	Fri, 31 Jan 2025 22:29:46 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 44gfaydtug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 22:29:46 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50VMTj005374482
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 22:29:46 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E399C58053;
	Fri, 31 Jan 2025 22:29:45 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B90A58043;
	Fri, 31 Jan 2025 22:29:45 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.92.209])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 31 Jan 2025 22:29:45 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: aspeed: Nullify bus messages after timeout
Date: Fri, 31 Jan 2025 16:29:41 -0600
Message-ID: <20250131222941.798065-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8k4kg-yy7iDnFfAV3vEbhkiM_5xjyyaa
X-Proofpoint-GUID: 8k4kg-yy7iDnFfAV3vEbhkiM_5xjyyaa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_08,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 mlxscore=0 suspectscore=0 mlxlogscore=749 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501310172
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: ryan_chen@aspeedtech.com, andi.shyti@kernel.org, openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

For multimaster case, it's conceivable that an interrupt comes
in after the transfer times out and attempts to use bus messages
that have already been freed by the i2c core.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 1550d3d552aed..e344dcc2233fe 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -731,6 +731,7 @@ static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
 		 * master command.
 		 */
 		spin_lock_irqsave(&bus->lock, flags);
+		bus->msgs = NULL;
 		if (bus->master_state == ASPEED_I2C_MASTER_PENDING)
 			bus->master_state = ASPEED_I2C_MASTER_INACTIVE;
 		spin_unlock_irqrestore(&bus->lock, flags);
-- 
2.43.5

