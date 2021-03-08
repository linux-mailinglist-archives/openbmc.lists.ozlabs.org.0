Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F65F331AB4
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 00:05:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvYq52fktz3d5l
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 10:05:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N3sEZVs/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=N3sEZVs/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvYZ04PrYz3cXM
 for <openbmc@lists.ozlabs.org>; Tue,  9 Mar 2021 09:54:32 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 128MZQPa076140; Mon, 8 Mar 2021 17:54:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=g5lxSof0S9B/b16R6r+gPJl2k3YYnN3bPBBoOH9gU6M=;
 b=N3sEZVs/9JFvVds0zwj8CdWfoqXppxBj6LrOIlO9zsyTNmYDJPsjDs0Nc56NFXHv0G8A
 QbQWP/KQhxAUXJ9EuWPxPY6VppJFOQ2yXHT5Osn5YA1Aif71JrRqeigq46y9nSj1kZ1V
 iZCMwakHoK4XF9QtcI/iBcTTLPZwI/4gVEL77KlSUUnq994kDpfigvFI/NVkn1blSsMo
 pjnavvb+Swf+Hp7/8mQb5Rj9p4WcwSEzcaJmtN4U9qp+Iy2MVHcVledKSxPkTRAu52eu
 kzSFCmPRPFcefQIbQuXaX7sF9cX+B0VsgfZ+c9WGxGuzoUPFhCKyi0P6jLwgarFfMzp8 Sg== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 375udq2cct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 17:54:30 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 128Mpcx1025292;
 Mon, 8 Mar 2021 22:54:29 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03wdc.us.ibm.com with ESMTP id 3741c91xkt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 22:54:29 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 128MsSQ213042196
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Mar 2021 22:54:28 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2CFA3C605F;
 Mon,  8 Mar 2021 22:54:28 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAE36C605A;
 Mon,  8 Mar 2021 22:54:27 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.41.147])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  8 Mar 2021 22:54:27 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 27/35] net/ncsi: Avoid channel_monitor hrtimer
 deadlock
Date: Mon,  8 Mar 2021 16:54:11 -0600
Message-Id: <20210308225419.46530-28-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210308225419.46530-1-eajames@linux.ibm.com>
References: <20210308225419.46530-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-08_20:2021-03-08,
 2021-03-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103080118
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

From: Milton Miller <miltonm@us.ibm.com>

Calling ncsi_stop_channel_monitor from channel_monitor is a guaranteed
deadlock on SMP because stop calls del_timer_sync on the timer that
inoked channel_monitor as its timer function.

Recognise the inherent race of marking the monitor disabled before
deleting the timer by just returning if enable was cleared.  After
a timeout (the default case -- reset to START when response recieved)
just mark the monitor.enabled false.

If the channel has an entrie on the channel_queue list, or if the the
state is not ACTIVE or INACTIVE, then warn and mark the timer stopped
and don't restart, as the locking is broken somehow.

Fixes: 0795fb2021f0 ("net/ncsi: Stop monitor if channel times out or is inactive")
Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 net/ncsi/ncsi-manage.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index a9cb355324d1..5a2beaf874c7 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -105,13 +105,20 @@ static void ncsi_channel_monitor(struct timer_list *t)
 	monitor_state = nc->monitor.state;
 	spin_unlock_irqrestore(&nc->lock, flags);
 
-	if (!enabled || chained) {
-		ncsi_stop_channel_monitor(nc);
-		return;
+	if (!enabled)
+		return;		/* expected race disabling timer */
+	if (WARN_ON_ONCE(chained)) {
+		goto bad_state;
 	}
 	if (state != NCSI_CHANNEL_INACTIVE &&
 	    state != NCSI_CHANNEL_ACTIVE) {
-		ncsi_stop_channel_monitor(nc);
+bad_state:
+		netdev_warn(ndp->ndev.dev,
+			    "Bad NCSI monitor state channel %d 0x%x %s queue\n",
+			    nc->id, state, chained ? "on" : "off");
+		spin_lock_irqsave(&nc->lock, flags);
+		nc->monitor.enabled = false;
+		spin_unlock_irqrestore(&nc->lock, flags);
 		return;
 	}
 
@@ -136,10 +143,9 @@ static void ncsi_channel_monitor(struct timer_list *t)
 		ncsi_report_link(ndp, true);
 		ndp->flags |= NCSI_DEV_RESHUFFLE;
 
-		ncsi_stop_channel_monitor(nc);
-
 		ncm = &nc->modes[NCSI_MODE_LINK];
 		spin_lock_irqsave(&nc->lock, flags);
+		nc->monitor.enabled = false;
 		nc->state = NCSI_CHANNEL_INVISIBLE;
 		ncm->data[2] &= ~0x1;
 		spin_unlock_irqrestore(&nc->lock, flags);
-- 
2.27.0

