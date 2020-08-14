Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D0C244E24
	for <lists+openbmc@lfdr.de>; Fri, 14 Aug 2020 19:36:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSrFX3lQqzDqnV
	for <lists+openbmc@lfdr.de>; Sat, 15 Aug 2020 03:36:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tomjose@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cNFf3hYB; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSrDT4PQMzDqgF
 for <openbmc@lists.ozlabs.org>; Sat, 15 Aug 2020 03:34:59 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07EHXQmx054329; Fri, 14 Aug 2020 13:34:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : from : subject : cc
 : message-id : date : mime-version : content-type; s=pp1;
 bh=cYVxn9G+AqzvBreS8LFRI+ClavmOoAul09nX2NkLOAQ=;
 b=cNFf3hYB+CbP2Dm5FBf6bAVxpzm+e0liD4FgUl6HtMNsy7cXiUPDqJC8Sfg54bWZeEq9
 XTxj38cMAkyFo3haRxwNLS/YAruGpWS+eLP7zoUloGrdsVxBNP7Ksgw5PKg6AhLMaR6+
 qvDINvkEsz7yfXB2Y2/vfshNZFivNfpvGMdFe7T8wzS8Pu4kBwVsJaePLiKUyqZcsvSl
 E79ZHStm5mHrtvHIf9hPdQV67KVaG5o8EQG4W/nJOMKHOJ9LUoBUKvK0BEtqPV3StwMI
 i/DNFnIO84tsaVzuDLf8HnluVeytKXYSB+l3kAztJtQPC4tnwJPVaV8eXfv9/+ZEqDyd RQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32wxfss6v7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Aug 2020 13:34:53 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07EHYrVL057928;
 Fri, 14 Aug 2020 13:34:53 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32wxfss6uh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Aug 2020 13:34:53 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07EHVHLv018018;
 Fri, 14 Aug 2020 17:34:50 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 32skp8eu35-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Aug 2020 17:34:50 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07EHYm5D25428310
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Aug 2020 17:34:48 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A7744C04A;
 Fri, 14 Aug 2020 17:34:48 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4069F4C050;
 Fri, 14 Aug 2020 17:34:47 +0000 (GMT)
Received: from [9.85.74.126] (unknown [9.85.74.126])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 14 Aug 2020 17:34:47 +0000 (GMT)
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, anoo@us.ibm.com
From: TOM JOSEPH <tomjose@linux.vnet.ibm.com>
Subject: IPMI implementation of Get Device ID command
Message-ID: <ff39e855-d5b6-a789-bcbb-3b87bf786bd1@linux.vnet.ibm.com>
Date: Fri, 14 Aug 2020 23:04:45 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------722B5CB026E0585286FC7699"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-14_12:2020-08-14,
 2020-08-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 spamscore=0 clxscore=1011 mlxscore=0 phishscore=0 adultscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008140131
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, benjaminfair@google.com, "Mauery,
 Vernon" <vernon.mauery@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------722B5CB026E0585286FC7699
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

We have an implementation of this command 
https://github.com/openbmc/phosphor-host-ipmid/blob/master/apphandler.cpp#L571 
. The current version of the code derives the major and minor firmware 
revision from the VERSION_ID field, and the auxiliary firmware revision 
is picked from dev_id.json. The auxiliary firmware revision is populated 
at build time 
https://github.com/openbmc/openbmc/blob/master/meta-ibm/recipes-phosphor/ipmi/phosphor-ipmi-config.bbappend.

The implementation of the code is obsolete, as it was based on an 
earlier format. The current format of VERSION_ID for example is, 
2.9.0-dev-609-g56f86d23c. There is already a WIP patch to fix this for 
the master tag format 
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/33893. 
<https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/33893>

IBM tagging format is different from the tag format of master builds. 
One choice is to have the major and minor version added to the 
dev_id.json and if the format of VERSION_ID does not match the master 
tag format,  pick from the json.

How are other companies converting their arbitrary tag formats to IPMI 
firmware revision fields? Does every company maintain their own 
downstream implementation of this command?

Is a common code possible for converting arbitrary tag formats to IPMI 
firmware revision fields?

Regards,
Tom



--------------722B5CB026E0585286FC7699
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Hello,<br>
    <br>
    We have an implementation of this command <a
href="https://github.com/openbmc/phosphor-host-ipmid/blob/master/apphandler.cpp#L571">https://github.com/openbmc/phosphor-host-ipmid/blob/master/apphandler.cpp#L571</a>
    . The current version of the code derives the major and minor
    firmware revision from the VERSION_ID field, and the auxiliary
    firmware revision is picked from dev_id.json. The auxiliary firmware
    revision is populated at build time <a
href="https://github.com/openbmc/openbmc/blob/master/meta-ibm/recipes-phosphor/ipmi/phosphor-ipmi-config.bbappend">https://github.com/openbmc/openbmc/blob/master/meta-ibm/recipes-phosphor/ipmi/phosphor-ipmi-config.bbappend</a>.<br>
    <br>
    The implementation of the code is obsolete, as it was based on an
    earlier format. The current format of VERSION_ID for example is,
    2.9.0-dev-609-g56f86d23c. There is already a WIP patch to fix this
    for the master tag format <a
href="https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/33893">https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/33893.</a>
    <p>IBM tagging format is different from the tag format of master
      builds. One choice is to have the major and minor version added to
      the dev_id.json and if the format of VERSION_ID does not match the
      master tag format,  pick from the json.<br>
      <br>
      How are other companies converting their arbitrary tag formats to
      IPMI firmware revision fields? Does every company maintain their
      own downstream implementation of this command? <br>
      <br>
      Is a common code possible for converting arbitrary tag formats to
      IPMI firmware revision fields?<br>
    </p>
    Regards,<br>
    Tom<br>
    <p><br>
    </p>
  </body>
</html>

--------------722B5CB026E0585286FC7699--

