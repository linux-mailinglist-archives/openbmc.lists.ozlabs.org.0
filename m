Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3D0146FED
	for <lists+openbmc@lfdr.de>; Thu, 23 Jan 2020 18:43:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483V4V62SzzDqZF
	for <lists+openbmc@lfdr.de>; Fri, 24 Jan 2020 04:43:38 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 483V3d4XbdzDqY3
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jan 2020 04:42:53 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00NHRoY0138547
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jan 2020 12:42:51 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xqch38x9e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jan 2020 12:42:50 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 00NHTdF0143653
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jan 2020 12:42:50 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xqch38x94-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jan 2020 12:42:50 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00NHe5ap009036;
 Thu, 23 Jan 2020 17:42:49 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 2xksn7kp29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jan 2020 17:42:49 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00NHgmXU56099314
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jan 2020 17:42:48 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3FF3778060;
 Thu, 23 Jan 2020 17:42:48 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09C597805E;
 Thu, 23 Jan 2020 17:42:47 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.252])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu, 23 Jan 2020 17:42:47 +0000 (GMT)
Subject: Re: openbmc REST API has too permissive CORS policy
To: Nishanth S <nishanths1992@gmail.com>, openbmc@lists.ozlabs.org
References: <CAOyHr8uiSxTrB5Q0t1dkydzoWLSa4AdAobTaYuRd5fKdRGAauw@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <6c8c28f8-8146-307c-e5de-592590c2b21e@linux.ibm.com>
Date: Thu, 23 Jan 2020 11:42:47 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAOyHr8uiSxTrB5Q0t1dkydzoWLSa4AdAobTaYuRd5fKdRGAauw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-23_10:2020-01-23,
 2020-01-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 malwarescore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001230137
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

On 1/22/20 7:50 PM, Nishanth S wrote:
> Hi All,
>
>      The BMC REST API effectively allows cross-origin requests from 
> any domain to almost all URLs. If a user accesses the API from a 
> browser, then any other malicious website visited in that browser will 
> be able to access the REST API without the user's knowledge.
>
> At line 1329 of rest_dbus.py [1], if the request contains an Origin 
> header, the
> REST server adds that origin to the "Access-Control-Allow-Origin" of the
> response:
>
>     def process_origin():
>         origin = request.headers.get('Origin')
>         if origin:
> *response.add_header('Access-Control-Allow-Origin', origin)
> response.add_header('Access-Control-Allow-Credentials', 'true')*
>
> Browsers use the Access-Control-Allow-Origin header to determine which 
> other origins are allowed to send cross-origin requests to the REST 
> API. This
> effectively allows all origins to send cross-origin requests. This 
> header is
> applied to all property and method accesses through the API.
>
>     What is the significance of this?

Thanks for your email!  You are referring to older web server.  You 
included a reference ("[1]") but I didn't see a link.  I assume:
https://github.com/openbmc/phosphor-rest-server/blob/bec10c202e2484fd36070ae4be26ddc2bd7267d1/module/obmc/wsgi/apps/rest_dbus.py#L1220

The OpenBMC project has moved to BMCWeb (https://github.com/openbmc/bmcweb).
BMCWeb uses OWASP recommendations for HTTP request and response 
headers.  See: 
https://github.com/openbmc/bmcweb/blob/master/include/security_headers_middleware.hpp

In particular, the default BMCWeb Content-Security-Policyincludes 
default-src 'none', so CORS is not allowed.  You can build BMCweb with 
BMCWEB_INSECURE_DISABLE_XSS_PREVENTION if you want to host your BMC's 
website off of the BMC (as some folks do for testing) or perform CORS in 
your secure environment.  For other uses, you're free to change the 
headers in your downstream implementation or discuss in the mailing list.

If you are using the old REST server, I would encourage you to move up 
to BMCWeb.  I am not aware of any maintenance on the phosphor rest server.

- Joseph

>
> Thank you,
> Nishanth
>
>
>

