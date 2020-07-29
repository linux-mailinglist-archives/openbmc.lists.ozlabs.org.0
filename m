Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 439CD23267F
	for <lists+openbmc@lfdr.de>; Wed, 29 Jul 2020 22:54:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BH5Q01XTlzDqn4
	for <lists+openbmc@lfdr.de>; Thu, 30 Jul 2020 06:54:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BH5Cn0Nx6zDqgr
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jul 2020 06:45:40 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06TKUbqH026076; Wed, 29 Jul 2020 16:45:36 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32k72bskkh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 16:45:36 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06TKZh0l030576;
 Wed, 29 Jul 2020 20:45:36 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma05wdc.us.ibm.com with ESMTP id 32gcy9vr0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 20:45:36 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06TKjZdt52953586
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jul 2020 20:45:35 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0F35112061;
 Wed, 29 Jul 2020 20:45:35 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25E1D11206B;
 Wed, 29 Jul 2020 20:45:35 +0000 (GMT)
Received: from ghost4.ibm.com (unknown [9.163.18.72])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 29 Jul 2020 20:45:35 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.7 6/6] eeprom: at25: Split reads into chunks and
 cap write size
Date: Wed, 29 Jul 2020 15:45:28 -0500
Message-Id: <20200729204528.15157-7-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200729204528.15157-1-eajames@linux.ibm.com>
References: <20200729204528.15157-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-29_14:2020-07-29,
 2020-07-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=1 impostorscore=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007290134
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Make use of spi_max_transfer_size to avoid requesting transfers that are
too large for some spi controllers.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 drivers/misc/eeprom/at25.c | 94 ++++++++++++++++++++++----------------
 1 file changed, 54 insertions(+), 40 deletions(-)

diff --git a/drivers/misc/eeprom/at25.c b/drivers/misc/eeprom/at25.c
index cde9a2fc1325..3ed041cb3083 100644
--- a/drivers/misc/eeprom/at25.c
+++ b/drivers/misc/eeprom/at25.c
@@ -64,12 +64,17 @@ static int at25_ee_read(void *priv, unsigned int offset,
 {
 	struct at25_data *at25 = priv;
 	char *buf = val;
+	size_t max_chunk = spi_max_transfer_size(at25->spi);
+	size_t num_msgs = count / max_chunk + (bool)(count % max_chunk);
+	size_t			nr_bytes = 0;
 	u8			command[EE_MAXADDRLEN + 1];
 	u8			*cp;
 	ssize_t			status;
 	struct spi_transfer	t[2];
 	struct spi_message	m;
 	u8			instr;
+	unsigned		msg_offset;
+	size_t			msg_count;
 
 	if (unlikely(offset >= at25->chip.byte_len))
 		return -EINVAL;
@@ -78,57 +83,64 @@ static int at25_ee_read(void *priv, unsigned int offset,
 	if (unlikely(!count))
 		return -EINVAL;
 
-	cp = command;
-
-	instr = AT25_READ;
-	if (at25->chip.flags & EE_INSTR_BIT3_IS_ADDR)
-		if (offset >= (1U << (at25->addrlen * 8)))
-			instr |= AT25_INSTR_BIT3;
-	*cp++ = instr;
-
-	/* 8/16/24-bit address is written MSB first */
-	switch (at25->addrlen) {
-	default:	/* case 3 */
-		*cp++ = offset >> 16;
-		/* fall through */
-	case 2:
-		*cp++ = offset >> 8;
-		/* fall through */
-	case 1:
-	case 0:	/* can't happen: for better codegen */
-		*cp++ = offset >> 0;
-	}
+	msg_offset = (unsigned) offset;
+	msg_count = min(count, max_chunk);
+	while (num_msgs) {
+		cp = command;
 
-	spi_message_init(&m);
-	memset(t, 0, sizeof(t));
+		instr = AT25_READ;
+		if (at25->chip.flags & EE_INSTR_BIT3_IS_ADDR)
+			if (msg_offset >= (1U << (at25->addrlen * 8)))
+				instr |= AT25_INSTR_BIT3;
+		*cp++ = instr;
 
-	t[0].tx_buf = command;
-	t[0].len = at25->addrlen + 1;
-	spi_message_add_tail(&t[0], &m);
+		/* 8/16/24-bit address is written MSB first */
+		switch (at25->addrlen) {
+			default:	/* case 3 */
+				*cp++ = msg_offset >> 16;
+				/* fall through */
+			case 2:
+				*cp++ = msg_offset >> 8;
+				/* fall through */
+			case 1:
+			case 0:	/* can't happen: for better codegen */
+				*cp++ = msg_offset >> 0;
+		}
 
-	t[1].rx_buf = buf;
-	t[1].len = count;
-	spi_message_add_tail(&t[1], &m);
+		spi_message_init(&m);
+		memset(t, 0, sizeof(t));
 
-	mutex_lock(&at25->lock);
+		t[0].tx_buf = command;
+		t[0].len = at25->addrlen + 1;
+		spi_message_add_tail(&t[0], &m);
 
-	/* Read it all at once.
-	 *
-	 * REVISIT that's potentially a problem with large chips, if
-	 * other devices on the bus need to be accessed regularly or
-	 * this chip is clocked very slowly
-	 */
-	status = spi_sync(at25->spi, &m);
-	dev_dbg(&at25->spi->dev, "read %zu bytes at %d --> %zd\n",
-		count, offset, status);
+		t[1].rx_buf = buf + nr_bytes;
+		t[1].len = msg_count;
+		spi_message_add_tail(&t[1], &m);
 
-	mutex_unlock(&at25->lock);
-	return status;
+		mutex_lock(&at25->lock);
+
+		status = spi_sync(at25->spi, &m);
+
+		mutex_unlock(&at25->lock);
+
+		if (status)
+			return status;
+
+		--num_msgs;
+		msg_offset += msg_count;
+		nr_bytes += msg_count;
+	}
+
+	dev_dbg(&at25->spi->dev, "read %zu bytes at %d\n",
+				count, offset);
+	return 0;
 }
 
 static int at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
 {
 	struct at25_data *at25 = priv;
+	size_t maxsz = spi_max_transfer_size(at25->spi);
 	const char *buf = val;
 	int			status = 0;
 	unsigned		buf_size;
@@ -191,6 +203,8 @@ static int at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
 		segment = buf_size - (offset % buf_size);
 		if (segment > count)
 			segment = count;
+		if (segment > maxsz)
+			segment = maxsz;
 		memcpy(cp, buf, segment);
 		status = spi_write(at25->spi, bounce,
 				segment + at25->addrlen + 1);
-- 
2.24.0

