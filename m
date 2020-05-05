Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB291C4EB0
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 09:00:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GVwN6BDSzDqXT
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 17:00:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=dkodihal@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GVvh1dnXzDqV3
 for <openbmc@lists.ozlabs.org>; Tue,  5 May 2020 16:59:28 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04562ZxV059964; Tue, 5 May 2020 02:59:25 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30s510fusb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 02:59:25 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0456A7Jn079486;
 Tue, 5 May 2020 02:59:24 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30s510furk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 02:59:24 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0456oDAD004984;
 Tue, 5 May 2020 06:59:22 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 30s0g5pbvw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 06:59:22 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0456wAtF50266612
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 May 2020 06:58:10 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9D5CA404D;
 Tue,  5 May 2020 06:59:19 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E6F7A4040;
 Tue,  5 May 2020 06:59:18 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.234.228])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  5 May 2020 06:59:18 +0000 (GMT)
Subject: Re: Storing host data on the BMC
To: Sunitha Harish <sunithaharish04@gmail.com>, patrick@stwcx.xyz,
 dkodihal@in.ibm.com, suryakanth.sekar@linux.intel.com,
 openbmc <openbmc@lists.ozlabs.org>
References: <CADeuMvXQfS01sdwpiM+POkaqdVesj64XGDqPWAPreo_TPbuV8A@mail.gmail.com>
 <f4df91bd-d60c-5f4b-ef08-2e3fdd163b4e@linux.vnet.ibm.com>
 <843851ce-b802-05af-2949-c3aa828aead7@gmail.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Message-ID: <ec87d606-9fa9-014a-bfa4-e56f94f6747e@linux.vnet.ibm.com>
Date: Tue, 5 May 2020 12:29:17 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <843851ce-b802-05af-2949-c3aa828aead7@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-05_02:2020-05-04,
 2020-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005050051
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

On 05/05/20 12:12 pm, Sunitha Harish wrote:
> Hi Deepak,
> 
> As mentioned , the Origin is the property which will be set by the host 
> once the IP address is applied to its interface. Its a read-only 
> property for the out-of-band user. But its a closely coupled - related 
> attribute on the host setting/BIOS object.

Hi Sunitha,

What I'm trying to say is - we shouldn't make this coupling. The BIOS 
settings table is a group of attributes that can alter the default 
behavior of the host firmware. The Origin property you describe doesn't 
fit that description.

The host "sets" several things for the BMC, for eg the host firmware can 
tell us functional/presence states of FRUs which the host has access to. 
Everything that the host "sets" this way isn't a BIOS attribute. Once 
you decouple this, I believe we can think about options other than the 
two you have suggested - since both of them involve making the Origin 
property seem like a BIOS attribute, which it clearly is not.

Thanks,
Deepak
