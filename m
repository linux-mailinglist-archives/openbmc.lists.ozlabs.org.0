Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6880033925
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2019 21:38:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HlhQ521QzDqRS
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 05:37:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Hlgk1jqJzDq9G
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jun 2019 05:37:21 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x53JWMBJ103399
 for <openbmc@lists.ozlabs.org>; Mon, 3 Jun 2019 15:37:19 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sw91x24cm-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 03 Jun 2019 15:37:18 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.ibm.com>;
 Mon, 3 Jun 2019 20:37:18 +0100
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 3 Jun 2019 20:37:16 +0100
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x53JbDuh19005526
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Jun 2019 19:37:14 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E32FBC6059;
 Mon,  3 Jun 2019 19:37:13 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B09CBC6055;
 Mon,  3 Jun 2019 19:37:13 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  3 Jun 2019 19:37:13 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 03 Jun 2019 14:38:10 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH dev-5.1] ARM: dts: aspeed: swift: Add VDD (IR35219) devices
In-Reply-To: <CACPK8Xc8_SAkxQ1_HTFOkCsV8ejWS=MVXazH+bvDcE=9xKLF8A@mail.gmail.com>
References: <1559334700-51970-1-git-send-email-anoo@linux.ibm.com>
 <CACPK8Xc8_SAkxQ1_HTFOkCsV8ejWS=MVXazH+bvDcE=9xKLF8A@mail.gmail.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19060319-0004-0000-0000-00001517BBAB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011209; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01212771; UDB=6.00637364; IPR=6.00993832; 
 MB=3.00027168; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-03 19:37:17
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060319-0005-0000-0000-00008BEA8D61
Message-Id: <66ef1d874db0bf4963f3ea80d3436c3f@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-03_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=946 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906030132
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@us.ibm.com>, linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2019-06-03 04:06, Joel Stanley wrote:
> On Fri, 31 May 2019 at 20:31, Adriana Kobylak <anoo@linux.ibm.com> 
> wrote:
>> 
>> From: Adriana Kobylak <anoo@us.ibm.com>
>> 
>> Add the VDD (IR35219) devices to the Swift device tree.
>> 
>> +       ir35219@70 {
>> +               compatible = "infineon,ir35219";
> 
> There's no driver for these in our tree. Do you have one coming?

Eddie will be writing one [Swift VDD VRM device driver 
#311](https://github.com/ibm-openbmc/dev/issues/311)
Should we put this patch on hold until the driver is done?

