Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 120AB1101E8
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2019 17:13:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47S6Ts6vY8zDqVb
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2019 03:13:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47S6TF0xzzzDqJW
 for <openbmc@lists.ozlabs.org>; Wed,  4 Dec 2019 03:12:47 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB3G8THi058709
 for <openbmc@lists.ozlabs.org>; Tue, 3 Dec 2019 11:12:45 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wnje9syst-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 03 Dec 2019 11:12:45 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xB3G9a6u105606
 for <openbmc@lists.ozlabs.org>; Tue, 3 Dec 2019 11:12:45 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wnje9syra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Dec 2019 11:12:45 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xB3G9wcv012607;
 Tue, 3 Dec 2019 16:12:43 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 2wkg26vrya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Dec 2019 16:12:43 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB3GCgcL49873302
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Dec 2019 16:12:42 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B1057805C;
 Tue,  3 Dec 2019 16:12:42 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5EFA77805E;
 Tue,  3 Dec 2019 16:12:42 +0000 (GMT)
Received: from [9.10.100.31] (unknown [9.10.100.31])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  3 Dec 2019 16:12:42 +0000 (GMT)
Subject: Re: BMC update via TFTP
To: rgrs <rgrs@protonmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <q7_GhCRdlxUNHfFX0Y4tW7FPq5Md7qwdFWbwd39V_S5zxrSBYtoXtvlNpQdZchvPB27edbJ3-QKFyZ97kzXoeH3Bby8IIHSWhxle9jzteKA=@protonmail.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <5747d991-27b7-4bb1-8a25-f46d1de832e1@linux.vnet.ibm.com>
Date: Tue, 3 Dec 2019 10:12:42 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <q7_GhCRdlxUNHfFX0Y4tW7FPq5Md7qwdFWbwd39V_S5zxrSBYtoXtvlNpQdZchvPB27edbJ3-QKFyZ97kzXoeH3Bby8IIHSWhxle9jzteKA=@protonmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-03_04:2019-12-02,2019-12-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 spamscore=0 mlxlogscore=870 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912030122
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


> In BMC WebUI under "Download image file from TFTP server" section,
> we have text fields "TFTP Server IP address" and "File name".
> "File name" doesn't take folders in path. Is this a bug or expected 
> behavior?
>
> TFTP downloads work only if file is kept in root of tftp share.
>
This is expected.
https://github.com/openbmc/phosphor-bmc-code-mgmt/blob/b0ce996ac60cf80487d71c3cdb7165d065079377/download_manager.cpp#L33
