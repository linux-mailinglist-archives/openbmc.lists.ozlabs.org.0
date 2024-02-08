Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6537284DAA8
	for <lists+openbmc@lfdr.de>; Thu,  8 Feb 2024 08:22:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KY6moMGn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TVpNb2fXmz3c4r
	for <lists+openbmc@lfdr.de>; Thu,  8 Feb 2024 18:22:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KY6moMGn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::235; helo=mail-oi1-x235.google.com; envelope-from=sunithaharish04@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TVpMz312Fz3bqQ
	for <openbmc@lists.ozlabs.org>; Thu,  8 Feb 2024 18:22:21 +1100 (AEDT)
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3bfcbfbfd92so785653b6e.2
        for <openbmc@lists.ozlabs.org>; Wed, 07 Feb 2024 23:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707376936; x=1707981736; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8aQUvQGcVs8N2FaBIlKl7xmWkoBJSTmhLKRO5vFEedM=;
        b=KY6moMGnB6LbcC4c+rPWLMzd5dL8u4VuPR6R3NSl5l5r/rvKb8ESQKSDvz4qT3ptTB
         2lAQ2Q3+peQSaJ3EtxJDbuWCjTmq0YFKOCTqIxNcnA2YH2mdgabnJV5tbCNaEpjYFTsf
         je25eiOF6ZYXuEiP7nml5lXlVXlGd1aJOApBDWhP+V+LgB9NNAsW+kLRNVmxWa897lqf
         QC3WuiNOVz+TW+sWQVeILx/yJn0iOrPHeciN5cpIzcfZOwaJm6bNmg7p0OWyGDJUdaSt
         j+1K7J129K5SE8tlX29RwesNiY40/N0jIVAZAp5ksrwrsQzmDBDCTxkP9IoYo831646D
         BR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707376936; x=1707981736;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8aQUvQGcVs8N2FaBIlKl7xmWkoBJSTmhLKRO5vFEedM=;
        b=Yr5qwUn82GOjPYCXW8POZlAVVCEcNc+3BrUoGUs2D9xJYjfM635apjraiGnb6uCGsU
         r9hLgVDLgw0eGQfFPAzCFgdz0GW/FY4Io+H9ba9epxZRZtjVsaROHxX7IldiJ+7Qs5tc
         dzq5o3wWE0mWd6eHbBrx+HkvPAJ0h+bZlZglEz12r+yi0tduf13a0CEj9VKpSDGGyvLL
         4Cuq6l1ot/KeQJaluiQMas37xPXaZ6g3K0rExP/dXpFEoiGq0oA5kPgiB4bMVOPXROOU
         OfKTm9x0+Obq/YbmmnrtQ88DQ+6YHcElUyLq0FxYn3JKyyCYMcoonaF806L3JzsROBMe
         +sow==
X-Gm-Message-State: AOJu0YwHiBmXKxlmxE4Mdwa5ZLCbAMmskKLeabLC6r/2pgP5Ls+HEJ0P
	VtTGMFdCKqY0gZAc+Kl2NA7fqDkEez8trmtdum03p36G75fwY8D2ohEsl+s1
X-Google-Smtp-Source: AGHT+IGiLbqPbESxwvznFEdHGnzRfewPZbrl7jsCxTueF2BkxeeAd+P9i6RazqdAI7k7evuSwF63bw==
X-Received: by 2002:a05:6808:d4:b0:3bf:d127:b510 with SMTP id t20-20020a05680800d400b003bfd127b510mr7708081oic.15.1707376936029;
        Wed, 07 Feb 2024 23:22:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVv03SwHh0DzCXFB4UEOmVUMCBl02ciUkigGcR1jTzt4+E/daX+P88ofVP8043+3AU2nXn6UpR8QGAE0idQGv7jvWaUSHe2L6n4RuVaOP9F+ECIe/Q/SgVc
Received: from ?IPV6:2620:1f7:3d44:7c48::32:3cb? ([2620:1f7:3d44:7c48::32:3cb])
        by smtp.gmail.com with ESMTPSA id hy6-20020a056a006a0600b006e06af90ff4sm2698209pfb.204.2024.02.07.23.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Feb 2024 23:22:15 -0800 (PST)
Message-ID: <88ba0256-2c86-4727-97b6-dce02ba61554@gmail.com>
Date: Thu, 8 Feb 2024 12:52:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Sunitha Harish <sunithaharish04@gmail.com>
Subject: File Manager Service in OpenBMC
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: gmills@us.ibm.com, ed@tanous.net, geissonator@yahoo.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

This email is about adding a FileManager Service in OpenBMC.

IBM has usecases implemented under /ibm/v1 path at bmcweb, which uploads 
and manages files on the BMC. This usecase is being re-designed, to stop 
bmcweb from modifying and accessing BMC file system directly.

To achieve this, a dbus & backend application is needed. This should 
provide APIs to Create, Update, Get and Delete a file. This application 
should also take care of security aspects of the File upload usecases, 
before letting the BMC file system updated. Please share your views on 
adding this application.

Thanks & regards,
Sunitha



