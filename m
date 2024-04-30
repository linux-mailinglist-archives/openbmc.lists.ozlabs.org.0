Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 064E68B6F8E
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2024 12:22:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTGVR50YBz3cTM
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2024 20:22:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTGV36tvXz3cLl;
	Tue, 30 Apr 2024 20:22:35 +1000 (AEST)
Received: from [141.14.220.34] (g34.guest.molgen.mpg.de [141.14.220.34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 8660F61E5FE36;
	Tue, 30 Apr 2024 12:21:46 +0200 (CEST)
Message-ID: <94b41f0d-a32b-4854-8528-91341a0a3bb8@molgen.mpg.de>
Date: Tue, 30 Apr 2024 12:21:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/2] modify Signed-off-by field
To: Chia Li Hung <ppighouse@gmail.com>
References: <20240430045853.3894633-1-Kelly_Hung@asus.com>
 <a21672d7-82dd-44a9-b301-94aa1537b75c@molgen.mpg.de>
 <CAK=2Bxt=WK4AdktNZDN2iXjk3ga9WRqUm9JQHoNjRnrW8hVt0Q@mail.gmail.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <CAK=2Bxt=WK4AdktNZDN2iXjk3ga9WRqUm9JQHoNjRnrW8hVt0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Kelly Hung <Kelly_Hung@asus.com>, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, Allenyy_Hsu@asus.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Chia,


Thank you for your reply. I am sorry, this causes so much trouble.


Am 30.04.24 um 12:04 schrieb Chia Li Hung:
> Paul Menzel 於 2024年4月30日 週二 下午2:48寫道：

>> Am 30.04.24 um 06:58 schrieb Kelly Hung:
>>> For the warning message:
>>> From: Kelly Hung '<ppighouse@gmail.com>' != 'Signed-off-by: Kelly Hung <Kelly_Hung@asus.com>'
>>>
>>> I replaced Kelly_Hung@asus.com with my private Gmail account.
>>>
>>> Due to a security issue with ASUS's mail server, I am unable to use
>>> ASUS's mail system to send patches out from my build server.
>>> So I executed git send-email using my private gmail account.
>>
>> To put light on ASUS’ upstream work, using your company address would be
>> nice in my opinion. Do you have it configured everything in git
>> (`~/.gitconfig`)?
>>
>>       git config --global user.name "Kelly Hung"
>>       git config --global user.email Kelly_Hung@asus.com

> Below is my git configuration.
> [user]
>          name = Kelly Hung
>          email = Kelly_Hung@asus.com
> [sendemail]
>          smtpserver = smtp.gmail.com
>          smtpEncryption = tls
>          smtpUser = ppighouse@gmail.com
>          smtpServerPort = 587
> 
> I made sure the "From" value after executing git format-patch was my ASUS
> email address.
> 
> From: Kelly Hung <Kelly_Hung@asus.com>
> Date: Thu, 29 Feb 2024 16:45:02 +0800
> Subject: [PATCH v7 1/2] dt-bindings: arm: aspeed: add ASUS X4TF board
> 
> Since my smtp server is Gmail, when I run send-gmail it replaces my "From"
> value with the Gmail account. I asked ASUS IT for assistance today and
> tried to get an SMTP acount.

*A thing you should know if you are using multiple email accounts with 
`git send-email`* [1] says to use

     git send-email --from ppighouse@gmail.com 000*.patch


Kind regards,

Paul


[1]: https://sjp38.github.io/post/git_send_email_multiple_email_caution/
