Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DCA8BBE9
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 16:47:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467FtC3ZVYzDqb5
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2019 00:47:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467FsP3RMRzDqTT
 for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2019 00:46:32 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7DEcchR069803; Tue, 13 Aug 2019 10:46:28 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uby398kwn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Aug 2019 10:46:28 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7DEenlp017701;
 Tue, 13 Aug 2019 14:46:27 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma05wdc.us.ibm.com with ESMTP id 2u9nj62sr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Aug 2019 14:46:27 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7DEkQLE52167106
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Aug 2019 14:46:26 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 095A3BE056;
 Tue, 13 Aug 2019 14:46:26 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C86D1BE04F;
 Tue, 13 Aug 2019 14:46:25 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 13 Aug 2019 14:46:25 +0000 (GMT)
Subject: Re: OpenBMC Solution To CVE issues
To: Yonghui YH21 Liu <liuyh21@lenovo.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <d739c79fc78643c8aa6da29522290874@lenovo.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <2841ed2f-ef3d-7cbb-3afb-c8c657382455@linux.ibm.com>
Date: Tue, 13 Aug 2019 09:46:25 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d739c79fc78643c8aa6da29522290874@lenovo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-13_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908130156
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

On 8/12/19 10:21 PM, Yonghui YH21 Liu wrote:
>
> HI All,
>
>          I saw there are some solutions to public CVE issues, some 
> solution are not enable by default setting.
>
I've provided by initial thoughts about how these CVEs affect OpenBMC.  
This is from the point of view of code running on OpenBMC 2.7.0 
systems.  My responses disregard vulnerabilities which may affect the 
build host.

Will BMC subject matter experts review the information below and provide 
answers?

- Joseph

>          As we know, there are some new coming CVE issues. Could you 
> help confirm whether below issues will be fixed? Is yes, when will be 
> ready?
>
>       CVE-2019-12900
>
The problem: BZ2 decompress - affects bzip2 through 1.0.6
Impact: we are impacted, we are at bzip2 1.0.6
How to exploit?  Do any OpenBMC interfaces use BZ2 compression? Image 
upload?  Web interfaces?  If so, we may be impacted.

> CVE-2018-20843
>
The problem: affects Expat XML before 2.2.7
Impact: Not applicable, OpenBMC does not use XML

> CVE-2019-9169
>
The problem: glibc/libc6 regexec proceed_next_node
Impact: we are impacted, we are on glibc 2.29
How to exploit?  Do any OpenBMC interfaces parse regular expressions?  
If so we may be impacted?  If not, this will be hared to exploit.

> CVE-2018-20750
>
The problem: libvncserver/rfbserver.c, affects LibVNC through 0.9.12
Impact: we may be impacted, we are on 0.9.12
Does our KVM use vncserver?

> CVE-2019-13404
>
The problem: Python installer, applies to Windows
Impact: not applicable, note that OpenBMC removed Python from the image

> Thank your great support in advance!
>
> Thanks
>

