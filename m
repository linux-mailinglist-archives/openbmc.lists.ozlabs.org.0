Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E0F261B0A
	for <lists+openbmc@lfdr.de>; Tue,  8 Sep 2020 20:53:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmDmx33l0zDqRb
	for <lists+openbmc@lfdr.de>; Wed,  9 Sep 2020 04:53:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gbVd43wX; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmDls4H3fzDqPC
 for <openbmc@lists.ozlabs.org>; Wed,  9 Sep 2020 04:52:08 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 088Ihe5b034529; Tue, 8 Sep 2020 14:52:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type; s=pp1; bh=9U6hoZ9of0YwLmLYiV52PI0CR2LGYuDKffOkza/BI5M=;
 b=gbVd43wXQM8FKAfeO+oWj1WdxGkbVhOo/9IAdv7/T47tFp3bTgoS2DAuCpaubzZ7neli
 x6gMz5pf5sN1haX9nuSiVRb9xuz7IYegaeLh3D04TVJjX8U3V5WyiVVMBGTc4OA9gBwc
 9dewZtlCyYkzFmge8s9Nhz2xZJQuJlOaMlmrg4VCUuwT0Ik8oWodOj8RX7MH97DF4SwT
 YWS+uwCjnw5laaxsUwLEMmpMd1dlg0j0Zve9DSaaBaepsan6NPOd0b9PMl+381z8tJf0
 xpILJDahGWmMYVYwKPMCrELIOLZBNgWEqlwpP79pB/wEOTqSismGQmbetOfsEA5YcjbK FA== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33effxg96c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Sep 2020 14:52:04 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 088IpU9v001836;
 Tue, 8 Sep 2020 18:52:03 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04wdc.us.ibm.com with ESMTP id 33c2a8sgaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Sep 2020 18:52:03 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 088Iq2G131981918
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Sep 2020 18:52:02 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D620AE05C;
 Tue,  8 Sep 2020 18:52:02 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F72FAE05F;
 Tue,  8 Sep 2020 18:52:01 +0000 (GMT)
Received: from [9.206.174.220] (unknown [9.206.174.220])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  8 Sep 2020 18:52:00 +0000 (GMT)
Subject: Re: How to comprehensively search the OpenBMC Archives
To: "Muggeridge, Matt" <matt.muggeridge2@hpe.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <AT5PR8401MB12193C196089B8572EE50F05D82D0@AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <5b0e1534-379a-837c-89be-53ef74049fc8@linux.vnet.ibm.com>
Date: Tue, 8 Sep 2020 12:51:59 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <AT5PR8401MB12193C196089B8572EE50F05D82D0@AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM>
Content-Type: multipart/alternative;
 boundary="------------DB679E3FC5268C8C00B26997"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-08_09:2020-09-08,
 2020-09-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=798 clxscore=1011 malwarescore=0 adultscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009080174
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

This is a multi-part message in MIME format.
--------------DB679E3FC5268C8C00B26997
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/2020 6:14 PM, Muggeridge, Matt wrote:
>
> Is there a more comprehensive/reliable way to search through these 
> mamil archives?
>
+1. Could we look at moving to Mailman v3 and like 
https://docs.mailman3.org/projects/hyperkitty/en/latest/ ?


> I have been using google to search the archives, but have noticed the 
> results are not complete.
>
>


--------------DB679E3FC5268C8C00B26997
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    <div class="moz-cite-prefix">On 9/3/2020 6:14 PM, Muggeridge, Matt
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:AT5PR8401MB12193C196089B8572EE50F05D82D0@AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal">Is there a more comprehensive/reliable way
          to search through these mamil archives?<br>
        </p>
      </div>
    </blockquote>
    <p>+1. Could we look at moving to Mailman v3 and like
      <a class="moz-txt-link-freetext" href="https://docs.mailman3.org/projects/hyperkitty/en/latest/">https://docs.mailman3.org/projects/hyperkitty/en/latest/</a> ?<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:AT5PR8401MB12193C196089B8572EE50F05D82D0@AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM">
      <div class="WordSection1">
        <p class="MsoNormal"><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">I have been using google to search the
          archives, but have noticed the results are not complete.<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <br>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------DB679E3FC5268C8C00B26997--

