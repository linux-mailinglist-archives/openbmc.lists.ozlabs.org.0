Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9A39752C
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 10:40:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46D1Mb3T2LzDqcY
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 18:40:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com;
 envelope-from=raviteja28031990@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mx3E1QEc"; 
 dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46D1Lx22xDzDqdh
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 18:40:08 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id u17so913314pgi.6
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 01:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:references:from:to:cc:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=IQ+tknpt3BejhycUyPARQuX0LK7XFaYhL3TxmuYssYA=;
 b=mx3E1QEcztUb1IN4C4RIR5k2yCu2PE1otuZz2F2KiIkRFxC5va2+qcXIRcUz948kLi
 Kj/j5jtbyDzGFg9wh4nz3jMbMLLUBQrKI/rLF2T/6T9FEpcDCtbfxzPgXk5p4joZUNdm
 czNHlvf6SQ1XfvTURROsJX4OhGRen0h8JRv9uxwwGU14RT7ZrUqA+FbLOwXYGf0yf5CN
 YINBdA6BNVC+aYbfE+YrsLIS33c73oxR+ubXlb34a2E/CxO8sHHOOUIwhkOPDe+OppNX
 zGQt2vb/tZUuvoudRFMu6xE8QGU14aAns1kQjHZz8klMtR25478JYcioeher0kut7KWY
 4Kcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:references:from:to:cc:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=IQ+tknpt3BejhycUyPARQuX0LK7XFaYhL3TxmuYssYA=;
 b=BGrVwofnqQ/8EOthtvfA+Hwiy8vKro4kWB8d93STI37CKkx88R6IGiFtcc2c8DfbuM
 q+YIcTkeuVDyoUpSKCR6Ss+M7/L6xIx7f1KxxQgI5m8Ia0m+yJTXHCsWRqK/G/GZusb6
 tk70xNOpCRy0eXpmo+dU+VMbgqcbmOFIX+8uJZqjhU6KyLARm/AAXor9ozvd4f2/KKaf
 XxhMPChOjBuVWBqw8FCfCjisxG6DH1m9trw9Xwaq90uIPKjIChugpGRg98Fesw7O7YZo
 T4yvAIOoCZtBRTNPjTVktf4j3eq0U2R5lEnpy81qwDXqq5tfXl1gjdn7+j+tcViJl1aZ
 RNQg==
X-Gm-Message-State: APjAAAVGbWCMf8bBuKkQ/bBa2BJF9LSFlmAW4bW1M0mMWmRm8zO9htfn
 cTO6c4mq10J4JpUNxE10mDGHzk/h
X-Google-Smtp-Source: APXvYqxJvZx6WthTnKv8cz9X0qrbW0HAFedxmMbEVG2QyKWidPwBp9fMEzMIZIUn+9xEY/aIT5zvaQ==
X-Received: by 2002:a63:f758:: with SMTP id f24mr2189396pgk.319.1566376804654; 
 Wed, 21 Aug 2019 01:40:04 -0700 (PDT)
Received: from [9.193.89.121] ([129.41.84.82])
 by smtp.gmail.com with ESMTPSA id e6sm38579525pfl.37.2019.08.21.01.40.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Aug 2019 01:40:04 -0700 (PDT)
Subject: Re: Continuing discussion on Handling persistent files
 (/etc/group)during BMC updates
References: <96f5e075-b324-90da-f004-703ab6275374@gmail.com>
 <20190809073304.GA327@bbwork.lan>
 <20dcb81d-9048-508c-d890-757b1d78db14@intel.com>
From: Raviteja Bailapudi <raviteja28031990@gmail.com>
To: ed.tanous@intel.com
Message-ID: <d7ec03f5-e798-290d-3e1f-074a97b151c5@gmail.com>
Date: Wed, 21 Aug 2019 14:10:01 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20dcb81d-9048-508c-d890-757b1d78db14@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 09-08-2019 21:13, Ed Tanous wrote:
> On 8/9/19 12:33 AM, Alexander A. Filippov wrote:
>> On Fri, Aug 09, 2019 at 12:19:32PM +0530, Raviteja Bailapudi wrote:
>>> Hi all,
>>>
>>> We are looking for thoughts and perspectives on the way the persistent files
>>> are managed across BMC code updates.
>>>
>>> The problem is regarding the code update where, as a part of code update we
>>> don't touch any of the persistent files like /etc/group or /etc/passwor
>>>
>>> what if the new BMC image has an application which requires some changes to
>>> be present in these persistent files ?
>>>
>>> For Example:
>>> Let's say the BMC image which is used for code update has a new
>>> feature(ex:avahi) and it requires avahi user and
>>> the group to be present in the /etc/passwd and /etc/group to even kick start
>>> it's daemon.
> One way that I've seen work quite well in other production firmwares is
> to treat it like you would a database schema, and simply generate the
> "new" files via patching the existing file in a script that executes on
> first new firmware startup.  In general, when you're messing with these
> files, you're either appending a new line, which would be done with a
> script like:
> if grep -Fxqv "avahi:x:41:" /etc/group
> then
> cat "avahi:x:41:" >> /etc/group
> fi

We implemented the same behavior through systemd override, where the 
service can check the

prerequisite for the service to start and add the group/password if it 
is not there.

Here is my commit
https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/24271/

> or you're modifying an existing line, which would be done with a sed
> replace.
>
> In the above, we're checking to see if the file has been changed
> appropriately before actually appending the line, to make sure that the
> update only gets applied once.  I've seen other cases where it makes
> more sense to simply leave a separate marker file, with an arbitrary
> revision number so that the BMC knows which updates it needs to apply.
> It really all depends on what you're attempting to add and whether or
> not it could conflict.
>
> If you're careful about how you craft the matching regexes, and keep the
> scripts around forever, you can generally transition files like that
> from one firmware update to another without any ill effects.
>
> The only case where it doesn't work is in the downgrade case, which gets
> really tricky really fast, and why most vendors give a "your mileage may
> vary" warning on downgrades, and recommend defaulting the configuration
> after a downgrade.
in the above mentioned commit, there this service file always get 
restarted and make sure that the prerequisite met.
