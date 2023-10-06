Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEE47BF147
	for <lists+openbmc@lfdr.de>; Tue, 10 Oct 2023 05:19:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UOEScz3I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4Ljv3rG8z2yjD
	for <lists+openbmc@lfdr.de>; Tue, 10 Oct 2023 14:19:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UOEScz3I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2H9f5n0hz3cB6
	for <openbmc@lists.ozlabs.org>; Sat,  7 Oct 2023 05:33:10 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 396IWSfm004362;
	Fri, 6 Oct 2023 18:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=c0ynSJqpEuhsm4PuIArRMC+8DD6XRSrOdxxHMUoAaOA=;
 b=UOEScz3IFe6i+0XxS3bWRiaBZzYBFZ9SpVyXjl0TN3HsOOqVxlMfm3uOVyxZmMCXy0mm
 /06tvHzN75x+cb+9nstv7Q8wBINiOq3rugKHUFZNnayNQpk7r6C70XWJt69Vmbd35Kn/
 ideyWK1/HmYTZmChEH/cqiCt1/grluwDpIDQKSCzLcNsY9bg7LpjBwprMvGDoxbGV5cV
 GIVlwr5GGjzaDFH+i3ETcUbOykfRdsHIygWvp/0KAgGQa86ooaJ3W459MAy4TBdhRmUO
 hXyhfQ7Jr9gyFDIRqBu9Wq9JZrCDU5ck9K8Y69uLdZfz9O2r1QSfafJ6AzvJOeEJcTQ/ RA== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tjqksr0ja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 18:33:05 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 396I3PIL010901;
	Fri, 6 Oct 2023 18:33:04 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tf0q3bj72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 18:33:04 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 396IVrFt37290694
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Oct 2023 18:31:53 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B5C45805C;
	Fri,  6 Oct 2023 18:31:53 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B9B515806A;
	Fri,  6 Oct 2023 18:31:52 +0000 (GMT)
Received: from [9.61.27.175] (unknown [9.61.27.175])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  6 Oct 2023 18:31:52 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------zCE5idTa0UFkPczCkFIbgt62"
Message-ID: <7dac095e-5e31-4aed-9b7b-a714a8748574@linux.ibm.com>
Date: Fri, 6 Oct 2023 13:31:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux dev-6.5 1/4] ARM: dts: aspeed: Rainier: Add fan
 controller properties
Content-Language: en-US
To: Eddie James <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <20231006172735.420566-1-eajames@linux.ibm.com>
 <20231006172735.420566-2-eajames@linux.ibm.com>
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <20231006172735.420566-2-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: J_UFKq7o6sjpQa1Ffwp5n13y8apBlZo2
X-Proofpoint-ORIG-GUID: J_UFKq7o6sjpQa1Ffwp5n13y8apBlZo2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-06_15,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 mlxscore=0 phishscore=0 clxscore=1015 adultscore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310060140
X-Mailman-Approved-At: Tue, 10 Oct 2023 14:15:18 +1100
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
Cc: joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------zCE5idTa0UFkPczCkFIbgt62
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/6/23 12:27, Eddie James wrote:
> Add the necessary Max chip specific fan properties.
>
> Signed-off-by: Eddie James<eajames@linux.ibm.com>
> Signed-off-by: Joel Stanley<joel@jms.id.au>
> ---
>   .../dts/aspeed/aspeed-bmc-ibm-rainier.dts     | 42 +++++++++++++++++++
>   1 file changed, 42 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts
> index 2566d26f6714..29d7ac2e3867 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts
> @@ -1083,36 +1083,78 @@ fan0: fan@0 {
>   			compatible = "pmbus-fan";
>   			reg = <0>;
>   			tach-pulses = <2>;
> +			maxim,fan-rotor-input = "tach";
> +			maxim,fan-pwm-freq = <25000>;
> +			maxim,fan-dual-tach;
> +			maxim,fan-no-watchdog;
> +			maxim,fan-no-fault-ramp;
> +			maxim,fan-ramp = <2>;
> +			maxim,fan-fault-pin-mon;
>   		};
>
>   		fan1: fan@1 {
>   			compatible = "pmbus-fan";
>   			reg = <1>;
>   			tach-pulses = <2>;
> +			maxim,fan-rotor-input = "tach";
> +			maxim,fan-pwm-freq = <25000>;
> +			maxim,fan-dual-tach;
> +			maxim,fan-no-watchdog;
> +			maxim,fan-no-fault-ramp;
> +			maxim,fan-ramp = <2>;
> +			maxim,fan-fault-pin-mon;
>   		};
>
>   		fan2: fan@2 {
>   			compatible = "pmbus-fan";
>   			reg = <2>;
>   			tach-pulses = <2>;
> +			maxim,fan-rotor-input = "tach";
> +			maxim,fan-pwm-freq = <25000>;
> +			maxim,fan-dual-tach;
> +			maxim,fan-no-watchdog;
> +			maxim,fan-no-fault-ramp;
> +			maxim,fan-ramp = <2>;
> +			maxim,fan-fault-pin-mon;
>   		};
>
>   		fan3: fan@3 {
>   			compatible = "pmbus-fan";
>   			reg = <3>;
>   			tach-pulses = <2>;
> +			maxim,fan-rotor-input = "tach";
> +			maxim,fan-pwm-freq = <25000>;
> +			maxim,fan-dual-tach;
> +			maxim,fan-no-watchdog;
> +			maxim,fan-no-fault-ramp;
> +			maxim,fan-ramp = <2>;
> +			maxim,fan-fault-pin-mon;
>   		};
>
>   		fan4: fan@4 {
>   			compatible = "pmbus-fan";
>   			reg = <4>;
>   			tach-pulses = <2>;
> +			maxim,fan-rotor-input = "tach";
> +			maxim,fan-pwm-freq = <25000>;
> +			maxim,fan-dual-tach;
> +			maxim,fan-no-watchdog;
> +			maxim,fan-no-fault-ramp;
> +			maxim,fan-ramp = <2>;
> +			maxim,fan-fault-pin-mon;
>   		};
>
>   		fan5: fan@5 {
>   			compatible = "pmbus-fan";
>   			reg = <5>;
>   			tach-pulses = <2>;
> +			maxim,fan-rotor-input = "tach";
> +			maxim,fan-pwm-freq = <25000>;
> +			maxim,fan-dual-tach;
> +			maxim,fan-no-watchdog;
> +			maxim,fan-no-fault-ramp;
> +			maxim,fan-ramp = <2>;
> +			maxim,fan-fault-pin-mon;
>   		};
>   	};
>
Reviewed-by: Ninad Palsule <ninad@linux.ibm.com>
--------------zCE5idTa0UFkPczCkFIbgt62
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/6/23 12:27, Eddie James wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20231006172735.420566-2-eajames@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">Add the necessary Max chip specific fan properties.

Signed-off-by: Eddie James <a class="moz-txt-link-rfc2396E" href="mailto:eajames@linux.ibm.com">&lt;eajames@linux.ibm.com&gt;</a>
Signed-off-by: Joel Stanley <a class="moz-txt-link-rfc2396E" href="mailto:joel@jms.id.au">&lt;joel@jms.id.au&gt;</a>
---
 .../dts/aspeed/aspeed-bmc-ibm-rainier.dts     | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts
index 2566d26f6714..29d7ac2e3867 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts
@@ -1083,36 +1083,78 @@ fan0: fan@0 {
 			compatible = "pmbus-fan";
 			reg = &lt;0&gt;;
 			tach-pulses = &lt;2&gt;;
+			maxim,fan-rotor-input = "tach";
+			maxim,fan-pwm-freq = &lt;25000&gt;;
+			maxim,fan-dual-tach;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp = &lt;2&gt;;
+			maxim,fan-fault-pin-mon;
 		};

 		fan1: fan@1 {
 			compatible = "pmbus-fan";
 			reg = &lt;1&gt;;
 			tach-pulses = &lt;2&gt;;
+			maxim,fan-rotor-input = "tach";
+			maxim,fan-pwm-freq = &lt;25000&gt;;
+			maxim,fan-dual-tach;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp = &lt;2&gt;;
+			maxim,fan-fault-pin-mon;
 		};

 		fan2: fan@2 {
 			compatible = "pmbus-fan";
 			reg = &lt;2&gt;;
 			tach-pulses = &lt;2&gt;;
+			maxim,fan-rotor-input = "tach";
+			maxim,fan-pwm-freq = &lt;25000&gt;;
+			maxim,fan-dual-tach;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp = &lt;2&gt;;
+			maxim,fan-fault-pin-mon;
 		};

 		fan3: fan@3 {
 			compatible = "pmbus-fan";
 			reg = &lt;3&gt;;
 			tach-pulses = &lt;2&gt;;
+			maxim,fan-rotor-input = "tach";
+			maxim,fan-pwm-freq = &lt;25000&gt;;
+			maxim,fan-dual-tach;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp = &lt;2&gt;;
+			maxim,fan-fault-pin-mon;
 		};

 		fan4: fan@4 {
 			compatible = "pmbus-fan";
 			reg = &lt;4&gt;;
 			tach-pulses = &lt;2&gt;;
+			maxim,fan-rotor-input = "tach";
+			maxim,fan-pwm-freq = &lt;25000&gt;;
+			maxim,fan-dual-tach;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp = &lt;2&gt;;
+			maxim,fan-fault-pin-mon;
 		};

 		fan5: fan@5 {
 			compatible = "pmbus-fan";
 			reg = &lt;5&gt;;
 			tach-pulses = &lt;2&gt;;
+			maxim,fan-rotor-input = "tach";
+			maxim,fan-pwm-freq = &lt;25000&gt;;
+			maxim,fan-dual-tach;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp = &lt;2&gt;;
+			maxim,fan-fault-pin-mon;
 		};
 	};

</pre>
    </blockquote>
    Reviewed-by: Ninad Palsule <a class="moz-txt-link-rfc2396E" href="mailto:ninad@linux.ibm.com">&lt;ninad@linux.ibm.com&gt;</a><br>
    <blockquote type="cite"
      cite="mid:20231006172735.420566-2-eajames@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------zCE5idTa0UFkPczCkFIbgt62--

