Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7F5117D24
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2019 02:25:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47X2Sd6sQMzDqVr
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2019 12:25:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47X2Rq3Sr4zDqVJ
 for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2019 12:25:10 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBA1MYRc047271; Mon, 9 Dec 2019 20:25:06 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wsm2dfet2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Dec 2019 20:25:06 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBA1K86Y007853;
 Tue, 10 Dec 2019 01:25:05 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 2wr3q6dahh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2019 01:25:05 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBA1P47F54460808
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Dec 2019 01:25:04 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDFD878063;
 Tue, 10 Dec 2019 01:25:03 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8864478060;
 Tue, 10 Dec 2019 01:25:03 +0000 (GMT)
Received: from demeter.local (unknown [9.85.130.38])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 10 Dec 2019 01:25:03 +0000 (GMT)
Subject: Re: BMC update via TFTP
To: Alexander Tereschenko <aleksandr.v.tereschenko@linux.intel.com>,
 openbmc@lists.ozlabs.org
References: <q7_GhCRdlxUNHfFX0Y4tW7FPq5Md7qwdFWbwd39V_S5zxrSBYtoXtvlNpQdZchvPB27edbJ3-QKFyZ97kzXoeH3Bby8IIHSWhxle9jzteKA=@protonmail.com>
 <5747d991-27b7-4bb1-8a25-f46d1de832e1@linux.vnet.ibm.com>
 <f778ce0c-f395-7528-ed05-cec194707a14@linux.vnet.ibm.com>
 <9e0303e5beb34b9bb50b050cd56e35d8@linux.vnet.ibm.com>
 <ed917fd0-61e1-3ff8-05f9-863d3e451c93@linux.ibm.com>
 <20191204213650.GB9613@mauery.jf.intel.com>
 <94b297b5-81d1-1e07-498f-155a9160cb1d@linux.intel.com>
 <20191205223708.GC9613@mauery.jf.intel.com>
 <1c75671d-904e-8a06-07f5-c93fcf0e5e50@linux.intel.com>
 <d6b4685e-5834-7bfb-609e-c53159a54176@linux.ibm.com>
 <f6254181-64e8-e923-8d60-9f7632a899e5@linux.intel.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <3231c302-27a9-3437-849a-767850d12fd0@linux.ibm.com>
Date: Mon, 9 Dec 2019 19:25:02 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <f6254181-64e8-e923-8d60-9f7632a899e5@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-09_05:2019-12-09,2019-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 clxscore=1015 bulkscore=0 mlxscore=0 impostorscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912100011
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

On 12/9/19 10:06 AM, Alexander Tereschenko wrote:
> On 06-Dec-19 23:52, Joseph Reynolds wrote:
>> I was thinking along the lines of adding [SFTP][] (or SCP) support 
>> and then migrating existing TFTP users to the new secure solution.
>>
>> That is, the BMC admin performing [code update][] can currently get a 
>> firmware image via POST DownloadViaTFTP to URI 
>> /xyz/openbmc_project/software.
>> My idea is to offer a DownloadViaSFTP method (or preferably a Redfish 
>> API) for this.  Note that the TFTP download is disabled by default 
>> per [bmcweb config][].
>>
>> Once OpenBMC supports downloading firmware via SFTP, we can encourage 
>> our users to set up their SFTP servers and take down their TFTP 
>> servers.  I realize that sounds easy, but I don't have a feeling how 
>> difficult that would be in practice.
>>
>> Does that sound feasible?
>>
>> - Joseph
>>
>> [SFTP]: https://man.openbsd.org/sftp-server
>> [code update]: 
>> https://github.com/openbmc/docs/blob/master/code-update/code-update.md
>> [bmcweb config]: 
>> https://github.com/openbmc/bmcweb/blob/41d1d1833f476766f88cfb624e66eef7906bdf8c/CMakeLists.txt#L98
>
> Yes, that could be a solution for the problem we discuss, providing 
> both integrity and confidentiality, without any major OpenBMC 
> development necessary - but it would mean more operational burden for 
> BMC admins. The problem with SCP/SFTP in this context is that for this 
> to work in the same manner as TFTP, the BMC must be an SSH client - 
> i.e. have some sort of identity/credentials for the SCP/SFTP server 
> provisioned first. That might not be the easiest solution to setup, 
> but it's of course possible and can be automated if OpenBMC provides 
> respective config knobs.
>
> Existing ways we have in code-update.md either don't require 
> credentials (TFTP), so being a client is easy, or are not making a 
> "client" from BMC, it's the admin who uploads stuff (SCP/REST).

Yes, that's what I was thinking.  (And no, I am not going to recommend 
setting up a SCP or SFTP server that allows anonymous access.)

This highlight the need for OpenBMC to put together a guide to 
provisioning your BMC.    Such as guide would give us a place to talk 
about uploading to the BMC SSH client certificates needed to access and 
download the firmware images.

- Joseph

>
> regards,
> Alexander
>

