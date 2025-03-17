Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F2AA64668
	for <lists+openbmc@lfdr.de>; Mon, 17 Mar 2025 09:58:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGTQY2QWRz3brB
	for <lists+openbmc@lfdr.de>; Mon, 17 Mar 2025 19:58:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742201888;
	cv=none; b=eTz/nsElGodx5W67tdaCcfgy1zQoXxF5pxAvp2ItJ6R6d/qXwYopF/wEXBR5iGVO21/180m60L0UGjl3OYr1uS8ORC73yyh6CSTLvUoCHFm3XSqVSAsGDcZ03pz1qT2r5yfgiUNB73VE+4sDZqtZaCSIAlE3zYVOSpUJia4943mhKu13PVVeu3+oIMQsc6tGSYlkt6vJtgGNfvGtSp685EBJnx6gHKBt4RJ82m4+r36/CdFbvw75nDyFYl4kQaRN1Uyes/RrAGg/h5pelEzwMjPCYzX+/+dt4iidM97F2E2RQ082rJ2qjy883U0yekqectC6KBnDq9H4t/9nhQcg+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742201888; c=relaxed/relaxed;
	bh=asAG8ifzS5TnfNYFFs+T/MgOzmKtZDts70S39RMV0cA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cw1asDcbdjj2yWNClLlSC8PpjV7PeY70LUrrZIIzw6IDjDthXRGDIUixMTW8A5AKdAm19ayr2PKUwM76FAPeTWo0l1giIWtI/AXztECo3gDtp0rxk0D5wiFIFXdpolYP0my5+KvbiuFr3pzjoBR35Gs7I5hOY/oiy/9OsPSFHCJyyfo2cO1AXaCy0jrl1N7O83lDRBauBSYFWBnQZbAPC4jj1pWUXJ4aQovSwe/MJVkhRkgH3QfGe3dji4iZ5vhUMsjFAj3MtLOzpoHjLSBxmhhLTgzEBT0B9RiDnQ9Qk9a/bsqwi0ajIQrJu0EJ1tNFcDHRprA9s0jV7LjNNVDj+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MKkRhJUP; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MKkRhJUP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGTQS04gbz2yLB;
	Mon, 17 Mar 2025 19:58:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DF743A488BF;
	Mon, 17 Mar 2025 08:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0826C4CEE3;
	Mon, 17 Mar 2025 08:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742201885;
	bh=asAG8ifzS5TnfNYFFs+T/MgOzmKtZDts70S39RMV0cA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MKkRhJUPmchxA6hSveaUHu6pkQzR3C5mkEqIr1ZmoljpP4zv/kDgmJQvK08zMcVuZ
	 VTS/mzi97Kd/e1CUXX08vwh98V54+omgy8vll9vNytEZkTDPFJlfVIDtYbqS3zcATr
	 1h2j7lCWc0JqWkKme5W8a0DRQUeQ3jqpM0lqkteY9Zec2BKVJg8QRCZMO52smCewUB
	 aL1TkOfIEyeDIf2m9rW2P8EqahhSjPmc+ssV5k5WUjY4yLZ7cZ+10OaiTnRzmrb9L+
	 /C4vrKAfZZQ0IwJ5UZEODGTPxbg3a52baXI8FTSaEYp7MvyT4Wecmq85rOdHRcGGJv
	 sCKW18R2qviFQ==
Message-ID: <e0d80130-ab5e-4e0b-8d74-ccc94d084192@kernel.org>
Date: Mon, 17 Mar 2025 09:57:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
To: Ryan Chen <ryan_chen@aspeedtech.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20250224055936.1804279-3-ryan_chen@aspeedtech.com>
 <202502280902.U0gLDhve-lkp@intel.com> <Z8GuOT5bJL7CdXX6@smile.fi.intel.com>
 <fec0a1c8-251b-491e-893d-11a8186a2128@kernel.org>
 <Z9fWhGDrUbAmGRl0@smile.fi.intel.com>
 <OS8PR06MB7541B15342ED1C92579AE18DF2DF2@OS8PR06MB7541.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <OS8PR06MB7541B15342ED1C92579AE18DF2DF2@OS8PR06MB7541.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, kernel test robot <lkp@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 17/03/2025 09:51, Ryan Chen wrote:
>> Subject: Re: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new register
>> mode driver
>>
>> On Mon, Mar 17, 2025 at 08:48:03AM +0100, Krzysztof Kozlowski wrote:
>>> On 28/02/2025 13:38, Andy Shevchenko wrote:
>>>> On Fri, Feb 28, 2025 at 09:28:59AM +0800, kernel test robot wrote:
>>>>> Hi Ryan,
>>>>>
>>>>> kernel test robot noticed the following build warnings:
>>>>>
>>>>> [auto build test WARNING on andi-shyti/i2c/i2c-host] [also build
>>>>> test WARNING on linus/master v6.14-rc4 next-20250227] [If your
>>>>> patch is applied to the wrong git tree, kindly drop us a note.
>>>>> And when submitting patch, we suggest to use '--base' as documented
>>>>> in
>>>>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>>>>
>>>>> url:
>> https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-bindings-i2c-asp
>> eed-support-for-AST2600-i2cv2/20250224-140221
>>>>> base:
>> https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
>>>>> patch link:
>> https://lore.kernel.org/r/20250224055936.1804279-3-ryan_chen%40aspeedtec
>> h.com
>>>>> patch subject: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new
>>>>> register mode driver
>>>>> config: mips-allyesconfig
>>>>> (https://download.01.org/0day-ci/archive/20250228/202502280902.U0gL
>>>>> Dhve-lkp@intel.com/config)
>>>>> compiler: mips-linux-gcc (GCC) 14.2.0 reproduce (this is a W=1
>>>>> build):
>>>>> (https://download.01.org/0day-ci/archive/20250228/202502280902.U0gL
>>>>> Dhve-lkp@intel.com/reproduce)
>>>>>
>>>>> If you fix the issue in a separate patch/commit (i.e. not just a
>>>>> new version of the same patch/commit), kindly add following tags
>>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>>> | Closes:
>>>>> | https://lore.kernel.org/oe-kbuild-all/202502280902.U0gLDhve-lkp@i
>>>>> | ntel.com/
>>>>>
>>>>> All warnings (new ones prefixed by >>):
>>>>
>>>> My gosh, this is valid report. But it looks like a preexisted issue.
>>>> Can somebody fix this, please?
>>>
>>>
>>> That was three weeks ago and still no responses from Aspeed or
>>> contributors from here.
>>>
>>> I think this tells a lot about aspeedtech.com patchsets on the list.
>>
> Sorry, I don't aware this is my patches issue, could you tell me what build instruction can reproduce this?

Everything is explained in the email. You do not need two people
explaining the report, just read the report.

Best regards,
Krzysztof
