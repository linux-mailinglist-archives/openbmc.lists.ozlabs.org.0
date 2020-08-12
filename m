Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD7E242C19
	for <lists+openbmc@lfdr.de>; Wed, 12 Aug 2020 17:21:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRYMd0zwXzDqP6
	for <lists+openbmc@lfdr.de>; Thu, 13 Aug 2020 01:21:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Iq1ccrC9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRYKg1tQ6zDqMt
 for <openbmc@lists.ozlabs.org>; Thu, 13 Aug 2020 01:20:05 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07CF1pAs038000
 for <openbmc@lists.ozlabs.org>; Wed, 12 Aug 2020 11:20:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type; s=pp1; bh=Xhh4RAUlpCbH6UBM/gSQdHxcDKBrh2GGf4szgVBNRXs=;
 b=Iq1ccrC9XzreY2vG908v9BOiqG6KmiSRBhgHwXt9dETeB797t+dMK10ifRabA87vnByJ
 JLNUfqKfnE5Sr62Zg1B63hwtqjjIh/XBJsb/0pTv+eaAypAWiAAUGpLdmnGKrXKO+LUt
 GGA7GiTPhG2nXb6HBUSTtAG4+PL20kc6RfQC454dRzX09pSvUbeOP+5NRazeaTBd5Rhv
 sB5Cg00liroqv7fM/Azpn/tHwmUVIMFAaaWv5jOARD7Z7JaoqfIoCRNOA81Xf+CgL+uV
 cq0AGXJAcYia6eIGmClcWLkJMyuhmDQx7+oenAxqT4KXKXhGHU/bygSM/stjFPi0OSGY Nw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32vcsxv8pb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 12 Aug 2020 11:20:02 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07CF2MBx040903
 for <openbmc@lists.ozlabs.org>; Wed, 12 Aug 2020 11:20:01 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32vcsxv8nq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Aug 2020 11:20:01 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07CFF82e007660;
 Wed, 12 Aug 2020 15:20:01 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04dal.us.ibm.com with ESMTP id 32skp9b4jc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Aug 2020 15:20:01 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07CFJxTU56230266
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Aug 2020 15:19:59 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C54A13604F;
 Wed, 12 Aug 2020 15:19:59 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41099136063;
 Wed, 12 Aug 2020 15:19:58 +0000 (GMT)
Received: from [9.206.214.67] (unknown [9.206.214.67])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 12 Aug 2020 15:19:57 +0000 (GMT)
Subject: Re: Question about WEBUI
To: =?UTF-8?B?5p2OIOaYn+aYnw==?= <ur.starklee@gmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <BN8PR20MB268985C7163EF6A03E9E47ADA7420@BN8PR20MB2689.namprd20.prod.outlook.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <ddf722b4-5bac-cbfa-523e-850394627aa0@linux.vnet.ibm.com>
Date: Wed, 12 Aug 2020 09:19:55 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <BN8PR20MB268985C7163EF6A03E9E47ADA7420@BN8PR20MB2689.namprd20.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------C9D4AC5E96ED8C0A622019E4"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-12_06:2020-08-11,
 2020-08-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 adultscore=0 mlxlogscore=994 malwarescore=0 phishscore=0
 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008120104
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
--------------C9D4AC5E96ED8C0A622019E4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/12/2020 2:38 AM, 李 星星 wrote:
>
> Hi,
>
>        I am stark and a newbee for openBMC development.
>
Welcome to OpenBMC!

> Our company are planning to develop a customized software to manage 
> BMC for our template. I am trying to use openBMC as framework and I 
> have set up all required environment.
>
> For now I have set up a system based on Ubantu 16.0.4 and download all 
> packages. Then I successfully build an image based on Romulus and use 
> qemu to start it. And I can open localhost:2443 to manage it. All the 
> steps have been done as Github procedures.
>
> But as requirement we want to customize the WebUI and I try to do as 
> Github. I put phosphor-webui in build directory.
>
I would really recommend you give https://github.com/openbmc/webui-vue a 
look, it is a replacement for phosphor-webui.
webui-vue uses the Redfish API, is translatable, themeable, does not 
suffer some the anti-patterns that exist in phosphor-webui today, and is 
built on Vue.

> And use npm start it. My npm version is 6.14.7. But when I try to 
> login into my image with special IP address. It failed and show 
> cors-xml problem and server unreachable.
>
To run the GUI locally you need to recompile bmcweb with 
BMCWEB_INSECURE_DISABLE_XSS_PREVENTION and 
BMCWEB_INSECURE_DISABLE_CSRF_PREVENTION turned on.
These are insecure and should be used for development only.

https://github.com/openbmc/phosphor-webui#logging-in

> After that I find original code in 
> /home/bmc/openbmc/build/tmp/work/all-openbmc-linux/phosphor-webui/1.0+gitAUTOINC+2e1eec80de-r1/git/, 
> and I try to change its logo picture. But it did not work. Can you 
> give some advices how to do that? I can’t find some useful  tutorials.
>
>
Have you seen 
https://github.com/openbmc/docs/blob/master/development/web-ui.md ?

- Gunnar



--------------C9D4AC5E96ED8C0A622019E4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 8/12/2020 2:38 AM, 李 星星 wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:BN8PR20MB268985C7163EF6A03E9E47ADA7420@BN8PR20MB2689.namprd20.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@\7B49 \7EBF ";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Times;
	panose-1:0 0 5 0 0 0 0 2 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:DengXian;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:DengXian;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:DengXian;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
      <div class="WordSection1">
        <p class="MsoNormal"><span style="font-family:Times"
            lang="EN-US">Hi,<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-family:Times"
            lang="EN-US">       I am stark and a newbee for openBMC
            development.</span></p>
      </div>
    </blockquote>
    Welcome to OpenBMC!<br>
    <br>
    <blockquote type="cite"
cite="mid:BN8PR20MB268985C7163EF6A03E9E47ADA7420@BN8PR20MB2689.namprd20.prod.outlook.com">
      <div class="WordSection1">
        <p class="MsoNormal"><span style="font-family:Times"
            lang="EN-US">Our company are planning to develop a
            customized software to manage BMC for our template. I am
            trying to use openBMC as framework and I have set up all
            required environment. <o:p></o:p></span></p>
        <p class="MsoNormal" style="text-indent:21.0pt"><span
            style="font-family:Times" lang="EN-US">For now I have set up
            a system based on Ubantu 16.0.4 and download all packages.
            Then I successfully build an image based on Romulus and use
            qemu to start it. And I can open localhost:2443 to manage
            it. All the steps have been done as Github procedures.
            <o:p></o:p></span></p>
        <p class="MsoNormal" style="text-indent:21.0pt"><span
            style="font-family:Times" lang="EN-US">But as requirement we
            want to customize the WebUI and I try to do as Github. I put
            phosphor-webui in build directory. </span></p>
      </div>
    </blockquote>
    I would really recommend you give
    <a class="moz-txt-link-freetext" href="https://github.com/openbmc/webui-vue">https://github.com/openbmc/webui-vue</a> a look, it is a replacement for
    phosphor-webui. <br>
    <span id="output" class="style-scope gr-linked-text">webui-vue uses
      the Redfish
      API, is translatable, themeable, does not suffer some the
      anti-patterns that
      exist in phosphor-webui today, and is built on Vue.<br>
      <br>
    </span>
    <blockquote type="cite"
cite="mid:BN8PR20MB268985C7163EF6A03E9E47ADA7420@BN8PR20MB2689.namprd20.prod.outlook.com">
      <div class="WordSection1">
        <p class="MsoNormal" style="text-indent:21.0pt"><span
            style="font-family:Times" lang="EN-US">And use npm start it.
            My npm version is 6.14.7. But when I try to login into my
            image with special IP address. It failed and show cors-xml
            problem and server unreachable.
          </span></p>
      </div>
    </blockquote>
    <p>To run the GUI locally you need to recompile bmcweb with
      BMCWEB_INSECURE_DISABLE_XSS_PREVENTION and
      BMCWEB_INSECURE_DISABLE_CSRF_PREVENTION turned on.<br>
      These are insecure and should be used for development only.<br>
      <br>
      <a class="moz-txt-link-freetext" href="https://github.com/openbmc/phosphor-webui#logging-in">https://github.com/openbmc/phosphor-webui#logging-in</a><br>
      <br>
    </p>
    <blockquote type="cite"
cite="mid:BN8PR20MB268985C7163EF6A03E9E47ADA7420@BN8PR20MB2689.namprd20.prod.outlook.com">
      <div class="WordSection1">
        <p class="MsoNormal" style="text-indent:21.0pt"><span
            style="font-family:Times" lang="EN-US"><o:p></o:p></span></p>
        <p class="MsoNormal" style="text-indent:21.0pt"><span
            style="font-family:Times" lang="EN-US">After that I find
            original code in
/home/bmc/openbmc/build/tmp/work/all-openbmc-linux/phosphor-webui/1.0+gitAUTOINC+2e1eec80de-r1/git/,
            and I try to change its logo picture. But it did not work.
            Can you give some advices how to do that? I can’t find some
            useful  tutorials.<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-family:Times"
            lang="EN-US"><o:p> <br>
            </o:p></span></p>
      </div>
    </blockquote>
    <p>Have you seen
      <a class="moz-txt-link-freetext" href="https://github.com/openbmc/docs/blob/master/development/web-ui.md">https://github.com/openbmc/docs/blob/master/development/web-ui.md</a>
      ?<br>
      <br>
      - Gunnar<br>
    </p>
    <span id="output" class="style-scope gr-linked-text"></span>
    <p><br>
    </p>
  </body>
</html>

--------------C9D4AC5E96ED8C0A622019E4--

