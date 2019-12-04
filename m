Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9769112EEB
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2019 16:48:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47SjtK452nzDqWF
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2019 02:48:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47SjsM6gYCzDqSr
 for <openbmc@lists.ozlabs.org>; Thu,  5 Dec 2019 02:47:19 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB4FhtBe098650
 for <openbmc@lists.ozlabs.org>; Wed, 4 Dec 2019 10:47:16 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wntctm2kx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 04 Dec 2019 10:47:16 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xB4Fi5TG099908
 for <openbmc@lists.ozlabs.org>; Wed, 4 Dec 2019 10:47:15 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wntctm2k8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Dec 2019 10:47:15 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xB4Fj5hK014705;
 Wed, 4 Dec 2019 15:47:19 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01wdc.us.ibm.com with ESMTP id 2wkg26eg7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Dec 2019 15:47:19 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB4FlB4657213210
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Dec 2019 15:47:11 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6EA813604F;
 Wed,  4 Dec 2019 15:47:11 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7715C136053;
 Wed,  4 Dec 2019 15:47:11 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed,  4 Dec 2019 15:47:11 +0000 (GMT)
Subject: Re: BMC update via TFTP
To: Adriana Kobylak <anoo@linux.ibm.com>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>
References: <q7_GhCRdlxUNHfFX0Y4tW7FPq5Md7qwdFWbwd39V_S5zxrSBYtoXtvlNpQdZchvPB27edbJ3-QKFyZ97kzXoeH3Bby8IIHSWhxle9jzteKA=@protonmail.com>
 <5747d991-27b7-4bb1-8a25-f46d1de832e1@linux.vnet.ibm.com>
 <f778ce0c-f395-7528-ed05-cec194707a14@linux.vnet.ibm.com>
 <9e0303e5beb34b9bb50b050cd56e35d8@linux.vnet.ibm.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <ed917fd0-61e1-3ff8-05f9-863d3e451c93@linux.ibm.com>
Date: Wed, 4 Dec 2019 09:47:10 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <9e0303e5beb34b9bb50b050cd56e35d8@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-04_03:2019-12-04,2019-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 bulkscore=0 adultscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 spamscore=0 mlxscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1912040131
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

On 12/3/19 1:55 PM, Adriana Kobylak wrote:
> On 2019-12-03 11:08, Gunnar Mills wrote:
>> On 12/3/2019 10:12 AM, Gunnar Mills wrote:
>>
>>>> In BMC WebUI under "Download image file from TFTP server" section,
>>>>
>>>> we have text fields "TFTP Server IP address" and "File name".
>>>> "File name" doesn't take folders in path. Is this a bug or
>>>> expected behavior?
>>>>
>>>> TFTP downloads work only if file is kept in root of tftp share.
>>> This is expected.
>>>
>> https://github.com/openbmc/phosphor-bmc-code-mgmt/blob/b0ce996ac60cf80487d71c3cdb7165d065079377/download_manager.cpp#L33 
>>
>>> [1]
>>
>> As long as we continue to sanitize the local filename, I don't see why
>> we need to limit the source file name.
>>  Patrick, Adriana, Any objection? Remember why we wrote it this way? I
>> assume for simplicity..?
>
> It was done for security to prevent users from specifying a file 
> outside the tftp directory, such as /mydir/../root/system-file.
> But seems the current file name handling breaks the ability to get 
> files from a subdir like Raj pointed out, we should be able to fix 
> that out, tftp supports having a file in subdirs such as 
> /tftpboot/subdirectory/file, and passing /subdirectory/file to it as 
> the path.

It seems to me that the burden must be on the TFTP server to protect 
itself.  See the "Security Considerations" section of RFC 1350 - 
https://tools.ietf.org/html/rfc1350
Specifically, OpenBMC only needs read access (it does not need to write 
files to the TFTP server) and only needs to be able to access files the 
TFTP server intends to provide (typically: all the files under a 
specific directory).

To be more clear:
- OpenBMC does not provide a TFTP server, so this is guidance for 
someone setting a TFTP server for use with an OpenBMC system
- The TFTP server only needs to offer READ access.
- The TFTP server ought to prevent clients from using 
cleverly-constructed pathnames (for example, any file which begins with 
"/" or contains an ".." element) to access files outside of its sandbox.
- That said, I am not a TFTP expert, and whichever TFTP server is used, 
its security guidance should be followed.

What all of the above, I think it would be okay for OpenBMC to validate 
the pathname it sends to the TFTP server, but don't think it is necessary.

Finally, I hope we can move away from TFTP and more toward a secure 
image distribution approach.
Note that TFTP is disabled in OpenBMC by default.  See 
https://github.com/openbmc/bmcweb/blob/master/CMakeLists.txt

- Joseph

>>
>>  Thanks,
>>  Gunnar
>>
>>
>> Links:
>> ------
>> [1]
>> https://github.com/openbmc/phosphor-bmc-code-mgmt/blob/b0ce996ac60cf80487d71c3cdb7165d065079377/download_manager.cpp#L33 
>>

