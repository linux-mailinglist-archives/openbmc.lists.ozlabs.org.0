Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 826422A4BAF
	for <lists+openbmc@lfdr.de>; Tue,  3 Nov 2020 17:36:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQb5v3pHFzDqn5
	for <lists+openbmc@lfdr.de>; Wed,  4 Nov 2020 03:36:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=shawnmm@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kitY2I9a; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQb4p2zTYzDqXR
 for <openbmc@lists.ozlabs.org>; Wed,  4 Nov 2020 03:35:50 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A3GVEIh120712
 for <openbmc@lists.ozlabs.org>; Tue, 3 Nov 2020 11:35:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : from : subject :
 message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=GUIcclGfVMtXGTDmZkgTBrCrygmeUHAyIG2IJnwDxOk=;
 b=kitY2I9aKO2gtnJXZKecVKqGhElU0jW0NoavrKF3nZytDsi7OZ+9PnZTHZ4OKodEwnQ+
 vybLNkV21LwhTkLo4glslsXu6g6h1JuW6bVZZJvrYndOhetslryT5AMpsxgCtOJMU0lN
 hbvUOEEB5/OP9hSBuzMc7thWXvbc1tWIHwwVd1B3fuUEd3dZUhJOq5+L6T/sySwb6fkT
 B8dRxUSpMEvDPLC1KQcX1fy5TcVtnnviwewCTiOjBTeo7NKcn6IvV8AN8edDFOodJkg2
 B7oHfscehN6+AHoNyRmI4wyGXMxNg2wgF4HDSvW4/dQcybVh9U4JFT8+NOPV9LiVN9Kw wQ== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34k9bwmhws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 03 Nov 2020 11:35:48 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A3GWCnY000687
 for <openbmc@lists.ozlabs.org>; Tue, 3 Nov 2020 16:35:47 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02wdc.us.ibm.com with ESMTP id 34h0evy5tv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 03 Nov 2020 16:35:47 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0A3GZk8X14615228
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 3 Nov 2020 16:35:46 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44B0478067
 for <openbmc@lists.ozlabs.org>; Tue,  3 Nov 2020 16:35:46 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 241DB78063
 for <openbmc@lists.ozlabs.org>; Tue,  3 Nov 2020 16:35:46 +0000 (GMT)
Received: from [9.211.76.180] (unknown [9.211.76.180])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Tue,  3 Nov 2020 16:35:45 +0000 (GMT)
To: openbmc@lists.ozlabs.org
From: Shawn McCarney <shawnmm@linux.vnet.ibm.com>
Subject: Easier way to create error logs with FFDC
Message-ID: <335508c6-a7be-a161-71fb-b0502418dd5b@linux.vnet.ibm.com>
Date: Tue, 3 Nov 2020 10:35:46 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-03_08:2020-11-03,
 2020-11-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011
 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 mlxlogscore=883 mlxscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011030108
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

Hi,

The D-Bus method CreateWithFFDCFiles can be used to create error log 
entries with First Failure Data Capture (FFDC) information. See 
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Logging/Create.interface.yaml#L32

Using this D-Bus method is a bit tricky because you need to pass in file 
descriptors to temporary files containing the FFDC data. So you need to 
create the temporary files with sufficiently unique names, and after the 
method is complete you need to close the file descriptors and delete the 
temporary files.  Obviously cleanup needs to happen on both good paths 
and error/exception paths.  If you have multiple FFDC files, you also 
need safe move semantics to put the information in a standard collection 
like vector.

I wrote a C++ class named FFDCFile to make calling this D-Bus method 
simpler.  It handles the problems above and has gtests to test it.  You 
can see the code here: 
https://github.com/openbmc/phosphor-power/blob/master/phosphor-regulators/src/ffdc_file.hpp 
.  It uses TemporaryFile and FileDescriptor utility classes.

Would there be interest it making this available in the phosphor-logging 
repository so it could be used by others?

Thanks,

Shawn

