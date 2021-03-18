Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E978E340364
	for <lists+openbmc@lfdr.de>; Thu, 18 Mar 2021 11:33:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1Nfg6qvtz3bn5
	for <lists+openbmc@lfdr.de>; Thu, 18 Mar 2021 21:33:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rxy3ep35;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ratagupt@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rxy3ep35; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1NfR4t3jz301C
 for <openbmc@lists.ozlabs.org>; Thu, 18 Mar 2021 21:33:34 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12IA3uhK058299; Thu, 18 Mar 2021 06:33:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=pJDZlfxlG3wyEpAa5eftWDzqRNN86BXJhFCFfMDqM3o=;
 b=rxy3ep35u9VK+IENB+OMHfxjvbAOP2QVgdiQyf1tRbq8o+Y/SCgCsB8mrHoFv8/BmO07
 iCHhtae/0jFl9FqQAJ4WS9FjkqNv8lbpr7Gc4S9M887yCJkSPSjLHzshHDTS51L7FFyx
 Z45sXSFx9u6MshfgnGSRzdHc5GDz9W8wDWOSzqnwP85Tnab6OintrqXQP94B9V5NvtFa
 3VV22QTZgNQuuUcz3HUBw20HTyLWKuutz+U1c9iVvx2jqWkYxFMumqxGFPZqAD2SB1dD
 gH5q4puh6dS8QrWx3i4aWzuwKukuzWP9XRLKX04OyIO1wILvw7N221158FikxbEtUK0T fA== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37c198pqav-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Mar 2021 06:33:27 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12IAX7vT003566;
 Thu, 18 Mar 2021 10:33:25 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 37b6xjgq9j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Mar 2021 10:33:25 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12IAXNYP39715076
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Mar 2021 10:33:23 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E96385204E;
 Thu, 18 Mar 2021 10:33:22 +0000 (GMT)
Received: from [9.85.93.146] (unknown [9.85.93.146])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 1119252059;
 Thu, 18 Mar 2021 10:33:21 +0000 (GMT)
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, Ed Tanous <ed@tanous.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Patrick Williams <patrick@stwcx.xyz>
Subject: Emit interface added signal
Message-ID: <580c5e6c-5946-eedc-25b0-53315a0831cd@linux.vnet.ibm.com>
Date: Thu, 18 Mar 2021 16:03:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-18_04:2021-03-17,
 2021-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 clxscore=1011
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103180073
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

Hi Team,

I faced the following issue in some of the D-Bus services.

Generally D-Bus services emit the interface added signal once the D-Bus 
object gets created.

D-Bus objects can be created in two scenario

1) Actual creation of D-Bus object due to some action.

2) Restore the old D-Bus objects reading from the file system.

    e.g. Restore the dump objects / Error log objects etc.

We are having some use cases where we have to send the Rest/Redfish 
event to the external clients once the dbus object gets added and for 
the same we watch for the interface added signal.

Due to the 2) we send the false events to the external clients as the 
D-Bus service gets restarted due to any reason(BMC reboot / Genuine 
Failure).

Proposal: Don't emit the interface added signal by the D-bus service if 
we are restoring the D-Bus objects from file system.

Do we see any concern here? or any other way to fix the above issue?

Ratan











