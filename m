Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC79C11058B
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2019 20:55:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47SCPx58GYzDqSn
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2019 06:55:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47SCPJ2WMszDqQc
 for <openbmc@lists.ozlabs.org>; Wed,  4 Dec 2019 06:54:43 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB3JbGb5125982
 for <openbmc@lists.ozlabs.org>; Tue, 3 Dec 2019 14:54:37 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wntb22gut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 03 Dec 2019 14:54:37 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xB3JbI8Q126143
 for <openbmc@lists.ozlabs.org>; Tue, 3 Dec 2019 14:54:37 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wntb22gtu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Dec 2019 14:54:36 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xB3JiAIm008480;
 Tue, 3 Dec 2019 19:54:34 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03wdc.us.ibm.com with ESMTP id 2wkg26px72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Dec 2019 19:54:34 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB3JsXBm11862286
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Dec 2019 19:54:33 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 977AD6A051;
 Tue,  3 Dec 2019 19:54:33 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6AFE06A04D;
 Tue,  3 Dec 2019 19:54:33 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  3 Dec 2019 19:54:33 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 03 Dec 2019 13:55:13 -0600
From: Adriana Kobylak <anoo@linux.ibm.com>
To: Gunnar Mills <gmills@linux.vnet.ibm.com>
Subject: Re: BMC update via TFTP
In-Reply-To: <f778ce0c-f395-7528-ed05-cec194707a14@linux.vnet.ibm.com>
References: <q7_GhCRdlxUNHfFX0Y4tW7FPq5Md7qwdFWbwd39V_S5zxrSBYtoXtvlNpQdZchvPB27edbJ3-QKFyZ97kzXoeH3Bby8IIHSWhxle9jzteKA=@protonmail.com>
 <5747d991-27b7-4bb1-8a25-f46d1de832e1@linux.vnet.ibm.com>
 <f778ce0c-f395-7528-ed05-cec194707a14@linux.vnet.ibm.com>
Message-ID: <9e0303e5beb34b9bb50b050cd56e35d8@linux.vnet.ibm.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-03_06:2019-12-02,2019-12-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 mlxlogscore=869
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912030144
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
Cc: openbmc@lists.ozlabs.org, rgrs <rgrs@protonmail.com>, anoo@us.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2019-12-03 11:08, Gunnar Mills wrote:
> On 12/3/2019 10:12 AM, Gunnar Mills wrote:
> 
>>> In BMC WebUI under "Download image file from TFTP server" section,
>>> 
>>> we have text fields "TFTP Server IP address" and "File name".
>>> "File name" doesn't take folders in path. Is this a bug or
>>> expected behavior?
>>> 
>>> TFTP downloads work only if file is kept in root of tftp share.
>> This is expected.
>> 
> https://github.com/openbmc/phosphor-bmc-code-mgmt/blob/b0ce996ac60cf80487d71c3cdb7165d065079377/download_manager.cpp#L33
>> [1]
> 
> As long as we continue to sanitize the local filename, I don't see why
> we need to limit the source file name.
>  Patrick, Adriana, Any objection? Remember why we wrote it this way? I
> assume for simplicity..?

It was done for security to prevent users from specifying a file outside 
the tftp directory, such as /mydir/../root/system-file.
But seems the current file name handling breaks the ability to get files 
from a subdir like Raj pointed out, we should be able to fix that out, 
tftp supports having a file in subdirs such as 
/tftpboot/subdirectory/file, and passing /subdirectory/file to it as the 
path.

> 
>  Thanks,
>  Gunnar
> 
> 
> Links:
> ------
> [1]
> https://github.com/openbmc/phosphor-bmc-code-mgmt/blob/b0ce996ac60cf80487d71c3cdb7165d065079377/download_manager.cpp#L33
