Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EC813A28D
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 09:11:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xjpP0C2lzDqPv
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 19:11:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=dkodihal@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xjnX6b1bzDqM0
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2020 19:10:40 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00E87O1m005548
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2020 03:10:36 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xfve9d89f-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2020 03:10:36 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Tue, 14 Jan 2020 08:10:34 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 14 Jan 2020 08:10:31 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00E8AUVu48431264
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jan 2020 08:10:30 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F1AA11C04C;
 Tue, 14 Jan 2020 08:10:30 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 806C311C04A;
 Tue, 14 Jan 2020 08:10:27 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.102.21.18])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 14 Jan 2020 08:10:27 +0000 (GMT)
Subject: Re: MCTP over PCI on AST2500
To: "Khetan, Sharad" <sharad.khetan@intel.com>, Jeremy Kerr <jk@ozlabs.org>
References: <gqnvvFdbRiXJzS3sVr0pSSo8kD6KjPbFMgg8CV1tsi0cKt0zT5mrnSTfBB1cpiOt-MVrXNzlg95DqgWZ3AxD8zOyEbFYRykqjP-DxEW4Mww=@protonmail.com>
 <037D4669-D49C-4DF8-B49B-4F3BD97451AE@fb.com>
 <865C376D1B77624AAA570EFEF73CE52F9E08757B@fmsmsx118.amr.corp.intel.com>
 <3502e928-40c5-41d9-9ff1-5aa199e0e31b@www.fastmail.com>
 <865C376D1B77624AAA570EFEF73CE52F9E0E4E3E@fmsmsx118.amr.corp.intel.com>
 <8a1fc80f-9d25-4c38-bdcd-df05c4194fe7@www.fastmail.com>
 <62036de3-ce3d-4ccb-ac5b-15e9ba39d22b@www.fastmail.com>
 <865C376D1B77624AAA570EFEF73CE52F9E10C8FD@fmsmsx118.amr.corp.intel.com>
 <92f857cc-303a-0d50-e0e4-2de2a8d19e41@linux.vnet.ibm.com>
 <865C376D1B77624AAA570EFEF73CE52F9E10E9A5@fmsmsx118.amr.corp.intel.com>
 <22A3B800-F833-4615-B980-EE933E1F83A9@ozlabs.org>
 <C232EE9B-92CA-4E7E-BBC7-083D0EBC547B@intel.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Tue, 14 Jan 2020 13:40:26 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <C232EE9B-92CA-4E7E-BBC7-083D0EBC547B@intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20011408-0008-0000-0000-000003492D88
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20011408-0009-0000-0000-00004A697F27
Message-Id: <5c242b16-a43f-cc9c-c37e-4cd4ea5c04b5@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-14_02:2020-01-13,
 2020-01-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=765 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-2001140071
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
Cc: "Winiarska, Iwona" <iwona.winiarska@intel.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 rgrs <rgrs@protonmail.com>, "Bhat, Sumanth" <sumanth.bhat@intel.com>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 14/01/20 12:09 PM, Khetan, Sharad wrote:
> Thanks for the pointer Jeremy. We will look into demux daemon.
> Thanks,
> -Sharad
> 
> On Jan 13, 2020, at 10:21 PM, Jeremy Kerr <jk@ozlabs.org 
> <mailto:jk@ozlabs.org>> wrote:
> 
>> Hi Ketan,
>>
>> Just a suggestion - you probably don't want to be passing MCTP 
>> messages over dbus - this is something we learnt from the IPMI 
>> implementation.

We could still have D-Bus endpoints that enable the BMC to identify MCTP 
devices connected to the BMC, jus that (agreeing with Jeremy here) the 
actual Tx/Rx could be backed the socket/kernel API.

